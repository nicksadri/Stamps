//
//  SignInPage.swift
//  Stamps
//
//  Created by Nick Sadri on 4/4/25.
//

import SwiftUI

struct SignUpPasswordView: View {
    
    @StateObject private var viewModel = SignUpViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            Button {
                // TODO: take back to sign up page
            } label: {
                Image(systemName: "chevron.backward")
            }
            .padding()
            .font(.title)
            Text("Choose a password")
                .font(.largeTitle)
                .bold()
                .padding(.horizontal)
                .padding(.bottom)
            VStack {
                PasswordField(password: $viewModel.password, passwordHidden: $viewModel.passwordHidden)
                Button {
                    // TODO: create account
                } label: {
                    Text("Continue")
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
    SignUpPasswordView()
}
