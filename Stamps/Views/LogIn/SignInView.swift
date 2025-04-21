//
//  SignIn.swift
//  Stamps
//
//  Created by Nick Sadri on 4/3/25.
//

import SwiftUI

struct SignInView: View {
    
    @StateObject var signInViewModel = SignInViewModel()
    @StateObject private var forgotPasswordViewModel = ForgotPasswordViewModel()
    @State private var passwordHidden = true
    @State private var forgotPasswordShown = false
    @State private var passwordResetPopUpShown = false
    
    var body: some View {
        ZStack {
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
                    TextField("Email address", text: $signInViewModel.email)
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
                    PasswordField(password: $signInViewModel.password, passwordHidden: $passwordHidden)
                    HStack {
                        Spacer()
                        Button {
                            forgotPasswordShown = true
                        } label: {
                            Text("Forgot your password?")
                                .font(.footnote)
                        }
                    }
                    .padding(.top, 8)
                    .padding(.horizontal)
                    // TODO: should this button be deactivated if email and password have not been properly entered?
                    Button {
                        signInViewModel.signIn()
                    } label: {
                        Text("Sign In")
                            .font(.body)
                            .foregroundColor(.white)
                            .padding(.vertical, 12)
                            .padding(.horizontal, 60)
                    }
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding()
                }
                Spacer()
            }
            .sheet(isPresented: $forgotPasswordShown) {
                ForgotPasswordView(viewModel: forgotPasswordViewModel, forgotPasswordIsOpen: $forgotPasswordShown, resetPasswordPopUpIsShown: $passwordResetPopUpShown)
            }
            if passwordResetPopUpShown {
                VStack {
                    PasswordResetPopUp(popUpIsOpen: $passwordResetPopUpShown)
                    Spacer()
                }
                .background(Color.black.opacity(0.5))
            }
        }
    }
}

#Preview {
    SignInView(signInViewModel: SignInViewModel())
}
