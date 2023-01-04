//
//  ForgotPasswordView.swift
//  Turf
//
//  Created by Jim Lambert on 1/4/23.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        NavigationView {
            
            VStack(spacing: 16) {
                InputTextFieldView(text: .constant(""),
                                   placeholder: "Email Address",
                                   keyboard: .emailAddress,
                                   icon: "envelope")
                
                ButtonView(title: "Reset Password", action: {
                    // TODO: Handle Password Reset
                    presentationMode.wrappedValue.dismiss()
                })
            }
            .padding(.horizontal, 15)
            .navigationTitle("Reset Password")
            .applyClose()
            
        }
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
