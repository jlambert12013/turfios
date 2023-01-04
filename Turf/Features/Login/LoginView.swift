//
//  LoginView.swift
//  Turf
//
//  Created by Jim Lambert on 1/4/23.
//

import SwiftUI

struct LoginView: View {
    
    var body: some View {
        
        VStack(spacing: 16){
            
            VStack(spacing: 16) {
                InputTextFieldView(text: .constant(""),
                                   placeholder: "Email",
                                   keyboard: .emailAddress,
                                   icon: "envelope")
                
                InputPasswordView(password: .constant(""),
                                  placeholder: "Password",
                                  icon: "lock")
                HStack {
                    Spacer()
                    Button(action: {}, label: {
                        Text("Forgot Password?")
                            .font(.system(size: 16, weight: .semibold))
                    })
                }
                
                VStack(spacing: 16) {
                    ButtonView(title: "Login", action: {
                        // TODO: Login Action
                    })
                    
                    ButtonView(title: "Sign Up",
                               background: .clear,
                               foreground: .blue,
                               border: .blue,
                               action: {
                        // TODO: Sign Up Action
                    })
                }
            }
            
        }
        .padding(.horizontal, 15)
        .navigationTitle("Login")
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LoginView()
        }
    }
}
