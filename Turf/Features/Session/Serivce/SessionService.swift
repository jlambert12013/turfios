//
//  SessionService.swift
//  Turf
//
//  Created by Jim Lambert on 1/5/23.
//

import Combine
import Foundation
import FirebaseAuth
import FirebaseDatabase

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
    
    init() {
        setupFirebaseAuthHandler()
    }
    
    func logOut() {
        
    }
    
}

extension SessionServiceImpl {
    
    func setupFirebaseAuthHandler() {
        
        
    }
    
    
}

