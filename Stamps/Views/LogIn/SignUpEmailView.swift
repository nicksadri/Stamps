//
//  SignInPage.swift
//  Stamps
//
//  Created by Nick Sadri on 3/27/25.
//

import SwiftUI

struct SignUpEmailView: View {
    
    @ObservedObject var viewModel: SignUpViewModel
    
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
                TextField("Email address", text: $viewModel.email)
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
                NavigationLink(destination: SignUpPasswordView(viewModel: viewModel)) {
                    Text("Continue")
                        .font(.body)
                        .foregroundColor(.white)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 60)
                        .background(viewModel.email.isEmpty ? Color.gray : Color.blue)
                        .cornerRadius(10)
                }
                // TODO: disable the button not only if the email text field is empty, but also if it is invalid in any way
                .disabled(viewModel.email.isEmpty)
                .padding()
                Spacer()
                Button() {
                    // TODO: take to login page
                } label: {
                    Text("Already on Stamps?")
                }
            }
            Spacer()
        }
    }
}

#Preview {
    SignUpEmailView(viewModel: SignUpViewModel())
}
