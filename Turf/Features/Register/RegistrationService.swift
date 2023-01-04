//
//  RegistrationService.swift
//  Turf
//
//  Created by Jim Lambert on 1/4/23.
//

import Firebase
import Combine
import Foundation
import FirebaseAuth
import FirebaseDatabase




enum Keys: String {     // These are the Keys & Values for storing results in Firebase
    case fireName
    case lastName
}

protocol RegistrationService {
    func register(with details: Registration) -> AnyPublisher<Void, Error>
}

final class RegistrationServiceImpl: RegistrationService {
    func register(with details: Registration) -> AnyPublisher<Void, Error> {
        
        Deferred {
            
            Future { promise in
                
            
                
                Auth.auth()
                    .createUser(withEmail: details.email,
                                password:  details.password ) { res, error in
                        
                        if let err = error {
                            promise(.failure(err))
                        } else {
                            if let uid = res?.user.uid {
                                let values = [Keys.fireName.rawValue: details.firstName,
                                              Keys.lastName.rawValue: details .lastName] as [String: Any]
                                
                                Database
                                    .database()
                                    .reference()
                                    .child("users")
                                    .child(uid)
                                    .updateChildValues(values) { error, ref in
                                        if let err = error {
                                            promise(.failure(err))
                                        } else {
                                            promise(.success(()))
                                        }
                                    }
                            } else {
                                promise(.failure(NSError(domain: "INVALID USER ID", code: 0, userInfo: nil)))
                            }
                        }
                        
                    }
                
            }
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
        
    }
    
}
