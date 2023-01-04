//
//  InputTextFieldView.swift
//  Turf
//
//  Created by Jim Lambert on 1/4/23.
//

import SwiftUI

struct InputTextFieldView: View {
    
    @Binding var text: String
    var placeholder: String
    var keyboard: UIKeyboardType
    var icon: String?
    
    private let leadingAmount: CGFloat = 30
    
    var body: some View {
        VStack {
            TextField(placeholder, text: $text)
                .frame(maxWidth: .infinity, minHeight: 50)
                .padding(.leading, icon == nil ? leadingAmount / 2 : leadingAmount)
                .keyboardType(keyboard)
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

struct InputTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            InputTextFieldView(text: .constant(""),
                               placeholder: "Email",
                               keyboard: .emailAddress,
                               icon: "envelope")
            .preview(with: "Email")
            
            
            InputTextFieldView(text: .constant(""),
                               placeholder: "First Name",
                               keyboard: .emailAddress,
                               icon: nil)
            .preview(with: "First Name")
        }
    }
}
