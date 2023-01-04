//
//  LoginView.swift
//  Turf
//
//  Created by Jim Lambert on 1/4/23.
//

import SwiftUI

struct LoginView: View {
    
    @State private var showRegister = false
    @State private var showForgotPassword = false
    
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
                    Button(action: {
                        showForgotPassword.toggle()
                    }, label: {
                        Text("Forgot Password?")
                            .font(.system(size: 16, weight: .semibold))
                            .sheet(isPresented: $showForgotPassword,
                                   content: {
                                ForgotPasswordView()
                            })
                    })
                }
                
                VStack(spacing: 16) {
                    ButtonView(title: "Login", action: {
                        // TODO: Login Action
                    })
                    
                    ButtonView(title: "Sign Up",
                               background: .clear,
                               foreground: .blue,
                               border: .blue) {
                        
                        showRegister.toggle()
                    }.sheet(isPresented: $showRegister,
                            content: {
                        RegisterView()
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
