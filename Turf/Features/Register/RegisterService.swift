//
//  RegisterService.swift
//  Turf
//
//  Created by Jim Lambert on 1/4/23.
//

import Foundation
import Combine
import FirebaseStorage

protocol RegisterService {
    func register(with details: RegistratinDetails) -> AnyPublisher<Void, Error>
}

final class RegisterServiceImpl: RegisterService {
    func register(with details: RegistratinDetails) -> AnyPublisher<Void, Error> {
        Deferred {
            Future { promise in
                
                let firebaseAuth = Auth.auth()
                firebaseAuth.createUser(withEmail: details.email, password: details.password) { res, error in
                    if let error = error {
                        promise(.failure(error))
                    } else {
                        // TODO: Handle
                    }
                }
            }
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }
}
