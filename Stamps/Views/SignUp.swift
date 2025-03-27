//
//  SignInPage.swift
//  Stamps
//
//  Created by Nick Sadri on 3/27/25.
//

import SwiftUI

struct SignUp: View {
    
    @StateObject private var viewModel = SignUpViewModel()
    
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
                Spacer()
                Button() {
                    // take to login page
                } label: {
                    Text("Already on Stamps?")
                }
            }
            Spacer()
        }
        
        
        
    }
}

#Preview {
    SignUp()
}
