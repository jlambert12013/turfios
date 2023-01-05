//
//  SessionService.swift
//  Turf
//
//  Created by Jim Lambert on 1/5/23.
//

import Combine
import FirebaseAuth
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

  init() { setupFirebaseAuthhandler() }

  func logOut() {

  }

}

extension SessionServiceImpl {

  fileprivate func setupFirebaseAuthhandler() {

    handler = Auth.auth().addStateDidChangeListener { [weak self] res, user in

      guard let self = self else { return }

      self.state = user == nil ? .loggedOut : .loggedIn

    }

  }
}

