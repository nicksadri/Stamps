//
//  SignIn.swift
//  Stamps
//
//  Created by Nick Sadri on 4/3/25.
//

import SwiftUI

struct SignIn: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var passwordHidden = true
    
    var body: some View {
        VStack(alignment: .leading) {
            Button {
                // TODO: take back to sign up page
            } label: {
                Image(systemName: "chevron.backward")
            }
            .padding()
            .font(.title)
            Text("Welcome back! 🛬")
                .font(.largeTitle)
                .bold()
                .padding(.horizontal)
            Text("Sign in to your account to continue traveling.")
                .font(.subheadline)
                .foregroundColor(Color(.darkGray))
                .padding(.horizontal)
                .padding(.bottom)
            VStack() {
                TextField("Email address", text: $email)
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
            }
            Spacer()
        }
    }
}

#Preview {
    SignIn()
}
