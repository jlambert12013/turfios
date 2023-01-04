//
//  RegisterView.swift
//  Turf
//
//  Created by Jim Lambert on 1/4/23.
//

import SwiftUI

struct RegistrationView: View {
    
    var body: some View {
        NavigationView {
            VStack(spacing: 32) {
                VStack(spacing: 16) {
                    InputTextFieldView(text: .constant(""),
                                       placeholder: "Email",
                                       keyboard: .emailAddress,
                                       icon: "envelope")
                    InputTextFieldView(text: .constant(""),
                                       placeholder: "Password",
                                       keyboard: .default,
                                       icon: "lock")
                    
                    Divider()
                    
                    InputTextFieldView(text: .constant(""),
                                       placeholder: "First Name",
                                       keyboard: .default)
                    InputTextFieldView(text: .constant(""),
                                       placeholder: "Last Name",
                                       keyboard: .default)
                }
                
                ButtonView(title: "Sign Up", action: {
                    // TODO: Handle Register
                })
            }
            .padding(.horizontal, 15)
            .navigationTitle("Register")
            .applyClose()
        }
        
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
