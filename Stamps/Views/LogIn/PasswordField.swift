//
//  PasswordField.swift
//  Stamps
//
//  Created by Nick Sadri on 4/4/25.
//

import SwiftUI

struct PasswordField: View {
    
    @Binding var password: String
    @Binding var passwordHidden: Bool
    
    var body: some View {
        ZStack(alignment: .trailing) {
            Group {
                if (passwordHidden) {
                    SecureField("Password", text: $password)
                } else {
                    TextField("Password", text: $password)
                }
            }
            .frame(height: 22)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled(true)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray.opacity(0.2), lineWidth: 1)
            )
            .padding(.horizontal)
            
            Button {
                passwordHidden.toggle()
            } label: {
                // TODO: figure out why toggling between "eye" and "eye.slash" causes a change in password field size
                Image(systemName: passwordHidden ? "eye" : "eye.slash")
                    .foregroundColor(Color(.gray))
            }
            .padding(.trailing, 30)
        }
    }
}

#Preview {
    PasswordField(password: .constant(""), passwordHidden: .constant(true))
}
