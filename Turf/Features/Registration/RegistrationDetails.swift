//
//  Registration.swift
//  Turf
//
//  Created by Jim Lambert on 1/4/23.
//

import Combine
import Foundation

struct RegistrationDetails {
    var email: String
    var password: String
    var firstName: String
    var lastName: String
}

extension RegistrationDetails {
    
    static var new: RegistrationDetails {
        
        RegistrationDetails(
            email: "",
            password: "",
            firstName: "",
            lastName: "")
        
    }
}
