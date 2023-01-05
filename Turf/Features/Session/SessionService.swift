//
//  SessionService.swift
//  Turf
//
//  Created by Jim Lambert on 1/5/23.
//

import Combine
import Foundation
import FirebaseAuth

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
    
//    private var let handler: AuthStateDidChangeListenerHandle?
    
    init(state: SessionState, userDetails: SessionUserDetails? = nil, handler: AuthStateDidChangeListenerHandle?) {
        self.state = state
        self.userDetails = userDetails
        self.handler = handler
    }
    
    
    func logOut() {
        //
    }
}

private extension SessionServiceImpl {
    func setupFirebaseAuthHandler() {
        handler = Auth.auth().addStateDidChangeListener { [weak self] res, user in
            guard let self = self else {
                return
            }
//            self.state == user == nil ? .loggedOut : .loggedIn
        }
    }
}
