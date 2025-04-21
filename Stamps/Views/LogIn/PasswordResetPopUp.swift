//
//  PasswordResetPopUp.swift
//  Stamps
//
//  Created by Nick Sadri on 4/5/25.
//

import SwiftUI

struct PasswordResetPopUp: View {
    
    @Binding var popUpIsOpen: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: "envelope.open")
                .font(.system(size: 60)) // make it larger
                .foregroundColor(.blue)  // optional styling
                .frame(maxWidth: .infinity)
                .padding(.vertical)
            Text("Check your email")
                .font(.largeTitle)
                .bold()
            Text("If the email address you provided is associated with a Stamps account, you should receive an email with instructions to reset your password. Be sure to check your spam folder if you don't see the email in your inbox.")
                .font(.subheadline)
                .foregroundColor(Color(.darkGray))
            Button {
                self.popUpIsOpen = false
            } label: {
                Text("Close")
                    .font(.body)
                    .foregroundColor(.white)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 60)
            }
            .background(Color.blue)
            .cornerRadius(10)
            .frame(maxWidth: .infinity)
            .padding(.vertical)
        }
        .padding(.horizontal)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
        .padding()
    }
}

#Preview {
    PasswordResetPopUp(popUpIsOpen: .constant(true))
}
