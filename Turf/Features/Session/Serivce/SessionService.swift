//
//  SessionService.swift
//  Turf
//
//  Created by Jim Lambert on 1/5/23.
//

import Combine
import FirebaseAuth
import FirebaseDatabase
import Foundation

enum SessionState {
  case loggedIn
  case loggedOut
}

protocol SessionService {
  var state: SessionState { get }
  var userDetails: SessionUserDetails? { get }
  func logOut()
}

final class SessionServiceImpl: ObservableObject, SessionService {

  @Published var state: SessionState = .loggedOut
  @Published var userDetails: SessionUserDetails?

  private var handler: AuthStateDidChangeListenerHandle?

  init() { setupFirebaseAuthHandler() }

  func logOut() {

  }
}

extension SessionServiceImpl {

  func setupFirebaseAuthHandler() {
    handler = Auth.auth()
      .addStateDidChangeListener { [weak self] res, user in

        guard let self = self else { return }

        self.state = user != nil ? .loggedIn : .loggedOut
      }
  }

  func handleRefresh(with uid: String) {
    Database.database()
      .reference()
      .child("users")
      .child(uid)
      .observe(.value) { [weak self] snapshot in

        guard let self = self,
          let value = snapshot.value as? NSDictionary,
          let email = value[RegistrationKeys.email.rawValue] as? String,
          let firstName = value[RegistrationKeys.firstName.rawValue] as? String,
          let lastName = value[RegistrationKeys.lastName.rawValue] as? String
        else { return }

        DispatchQueue.main.async {
          self.userDetails = SessionUserDetails(
            email: email,
            firstName: firstName,
            lastName: lastName)
        }

      }
  }

}
