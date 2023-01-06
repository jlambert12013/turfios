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






// Implementation of Session Service
final class SessionServiceImpl: ObservableObject, SessionService {
    
    @Published var state: SessionState = .loggedOut
    @Published var userDetails: SessionUserDetails?
    
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        setupFirebaseAuthHandler()
    }
    
    func logOut() {
        
    }
    
}

private extension SessionServiceImpl {
    
    func setupFirebaseAuthHandler() {
        
        handler = Auth.auth().addStateDidChangeListener { [weak self ] res, user in
            
            guard let self = self else {
                return
            }
            
            
//            if user != nil {
//                self.state = .loggedIn
//            } else {
//                self.state = .loggedOut
//            }
            
            // Shorthand of above if statment
            self.state = user != nil ? .loggedIn : .loggedOut

            
        }
        
    }
    
}


