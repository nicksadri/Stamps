//
//  SignIn.swift
//  Stamps
//
//  Created by Nick Sadri on 4/3/25.
//

import SwiftUI

struct SignInView: View {
    
    @StateObject private var viewModel = SignInViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Welcome back! 🛬")
                .font(.largeTitle)
                .bold()
                .padding(.horizontal)
                .padding(.top)
            Text("Sign in to your account to continue traveling.")
                .font(.subheadline)
                .foregroundColor(Color(.darkGray))
                .padding(.horizontal)
                .padding(.bottom)
            VStack() {
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
                    .padding(.bottom, 8)
                PasswordField(password: $viewModel.password, passwordHidden: $viewModel.passwordHidden)
                HStack {
                    Spacer()
                    Button {
                        // TODO: take to reset password
                    } label: {
                        Text("Forgot your password?")
                            .font(.footnote)
                    }
                }
                .padding(.top, 8)
                .padding(.horizontal)
                Button {
                    viewModel.signIn()
                } label: {
                    Text("Sign In")
                        .font(.body)
                        .foregroundColor(.white)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 60)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
            }
            Spacer()
        }
    }
}

#Preview {
    SignInView()
}
