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
                Button {
                    viewModel.signUp(password: viewModel.password)
                } label: {
                    Text("Continue")
                        .font(.body)
                        .foregroundColor(.white)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 60)
                        .background(!viewModel.passwordIsComplexEnough() || !viewModel.passwordIsLongEnough() ? Color.gray : Color.blue)
                        .cornerRadius(10)
                }
                .padding()
                .disabled(!viewModel.passwordIsComplexEnough() || !viewModel.passwordIsLongEnough())
            }
            VStack(alignment: .leading) {
                Text("Your password must:")
                    .bold()
                HStack{
                    if viewModel.passwordIsComplexEnough() {
                        Image(systemName: "checkmark")
                            .foregroundColor(.green)
                    } else {
                        Image(systemName: "xmark")
                            .foregroundColor(.red)
                    }
                    Text("Contain a letter, number, and special character")
                }
                HStack{
                    if viewModel.passwordIsLongEnough() {
                        Image(systemName: "checkmark")
                            .foregroundColor(.green)
                    } else {
                        Image(systemName: "xmark")
                            .foregroundColor(.red)
                    }
                    Text("Be 8-20 characters long")
                }
            }
            .font(.footnote)
            .padding(.horizontal)
            Spacer()
        }
    }
}

#Preview {
    SignUpPasswordView(viewModel: SignUpViewModel())
}
