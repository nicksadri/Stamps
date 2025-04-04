//
//  SignInPage.swift
//  Stamps
//
//  Created by Nick Sadri on 4/4/25.
//

import SwiftUI

struct SignUpPasswordView: View {
    
    @ObservedObject var viewModel: SignUpViewModel
    @State private var passwordHidden = true
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Choose a password")
                .font(.largeTitle)
                .bold()
                .padding()
            VStack {
                PasswordField(password: $viewModel.password, passwordHidden: $passwordHidden)
                // TODO: disable button when no password has been entered yet, or the entered password is invalid
                Button {
                    viewModel.signUp(password: viewModel.password)
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
                // TODO: add a description of minimum requirements for password, and enforce these within Firebase
            }
            Spacer()
        }
    }
}

#Preview {
    SignUpPasswordView(viewModel: SignUpViewModel())
}
