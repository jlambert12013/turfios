//
//  RegisterView.swift
//  Turf
//
//  Created by Jim Lambert on 1/4/23.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var vm = RegistrationViewModelImpl(service: RegistrationServiceImpl())
    
    var body: some View {
        NavigationView {
            VStack(spacing: 32) {
                VStack(spacing: 16) {
                    InputTextFieldView(
                        text: $vm.userDetails.email,
                        placeholder: "Email",
                        keyboard: .emailAddress,
                        icon: "envelope")
                    InputTextFieldView(
                        text: $vm.userDetails.password,
                        placeholder: "Password",
                        keyboard: .default,
                        icon: "lock")
                    
                    Divider()
                    
                    InputTextFieldView(
                        text: $vm.userDetails.firstName,
                        placeholder: "First Name",
                        keyboard: .default)
                    InputTextFieldView(
                        text: $vm.userDetails.lastName,
                        placeholder: "Last Name",
                        keyboard: .default)
                }
                
                ButtonView(
                    title: "Sign Up",
                    action: {
                        vm.register()
                    })
            }
            .padding(.horizontal, 15)
            .navigationTitle("Register")
            .applyClose()
        }
        
    }
}

struct RegistrationDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
