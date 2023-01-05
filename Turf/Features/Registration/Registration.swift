//
//  Registration.swift
//  Turf
//
//  Created by Jim Lambert on 1/4/23.
//

import Combine
import Foundation

struct Registration{
    var email: String
    var password: String
    var firstName: String
    var lastName: String
}

extension Registration {
    
    static var new: Registration {
        
        Registration(email: "",
                     password: "",
                     firstName: "",
                     lastName: "")
        
    }
}
