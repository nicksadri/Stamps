//
//  ForgotPasswordView.swift
//  Stamps
//
//  Created by Nick Sadri on 4/4/25.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @StateObject var viewModel: ForgotPasswordViewModel
    @Binding var forgotPasswordIsOpen: Bool
    @Binding var resetPasswordPopUpIsShown: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Forgot your password?")
                .font(.largeTitle)
                .bold()
                .padding(.horizontal)
                .padding(.top)
            Text("No worries! Enter your email to reset your password.")
                .font(.subheadline)
                .foregroundColor(Color(.darkGray))
                .padding(.horizontal)
                .padding(.bottom)
            VStack() {
                TextField("Email address", text: $viewModel.forgottenEmail)
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
                    .padding(.bottom, 8)
                // TODO: deactivate button if no email is entered
                Button {
                    viewModel.resetPassword()
                    forgotPasswordIsOpen = false
                    // TODO: add popup that tells user email has been sent
                    resetPasswordPopUpIsShown = true
                } label: {
                    Text("Send reset link")
                        .font(.body)
                        .foregroundColor(.white)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 60)
                }
                .background(Color.blue)
                .cornerRadius(10)
                .padding(.top)
                Button {
                    forgotPasswordIsOpen = false
                } label: {
                    Text("Cancel")
                        .font(.body)
                        .foregroundColor(.gray)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 60)
                }
            }
        }
        Spacer()
    }
}

#Preview {
    ForgotPasswordView(viewModel: ForgotPasswordViewModel(), forgotPasswordIsOpen: .constant(true), resetPasswordPopUpIsShown: .constant(false))
}
