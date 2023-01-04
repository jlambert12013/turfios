//
//  InputPasswordView.swift
//  Turf
//
//  Created by Jim Lambert on 1/4/23.
//



import SwiftUI

struct InputPasswordView: View {
    
    @Binding var password: String
    var placeholder: String
    var icon: String?
    
    private let leadingAmount: CGFloat = 30
    
    var body: some View {
        VStack {
            SecureField(placeholder, text: $password)
                .frame(maxWidth: .infinity, minHeight: 50)
                .padding(.leading, icon == nil ? leadingAmount / 2 : leadingAmount)
                .background(
                    
                    ZStack(alignment: .leading) {
                        if let systemImage = icon {
                            Image(systemName: systemImage)
                                .font(.system(size: 16, weight: .semibold))
                                .padding(.leading, 5)
                                .foregroundColor(Color.gray.opacity(0.3))
                        }
                        
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .stroke(Color.gray.opacity(0.2))
                    }
                )
        }
    }
}

struct InputPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            InputPasswordView(password:  .constant(""),
                              placeholder: "Password",
                              icon: "lock")
            .preview(with: "Password Field")
            
            InputPasswordView(password:  .constant(""),
                              placeholder: "Password",
                              icon: nil)
            .preview(with: "Password Field (No Icon)")
        }
    }
}
