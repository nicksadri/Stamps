//
//  SignInPage.swift
//  Stamps
//
//  Created by Nick Sadri on 3/27/25.
//

import SwiftUI

struct SignUpEmailView: View {
    
    @ObservedObject var signUpViewModel: SignUpViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Welcome! 🧳")
                .font(.largeTitle)
                .bold()
                .padding(.top)
                .padding(.horizontal)
            Text("Create your account and get traveling.")
                .font(.subheadline)
                .foregroundColor(Color(.darkGray))
                .padding(.horizontal)
                .padding(.bottom)
            VStack {
                TextField("Email address", text: $signUpViewModel.email)
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
                // TODO: prevent user from moving to SignUpPasswordView if there is an error related to the email (i.e., the email is already in use)
                NavigationLink(destination: SignUpPasswordView(viewModel: signUpViewModel)) {
                    Text("Continue")
                        .font(.body)
                        .foregroundColor(.white)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 60)
                        .background(signUpViewModel.isValidEmail() ? Color.blue : Color.gray)
                        .cornerRadius(10)
                }
                .disabled(!signUpViewModel.isValidEmail())
                .padding()
                Spacer()
                NavigationLink(destination: SignInView()) {
                    Text("Already on Stamps?")
                        .foregroundColor(.blue)
                }
            }
            Spacer()
        }
    }
}

#Preview {
    SignUpEmailView(signUpViewModel: SignUpViewModel())
}
