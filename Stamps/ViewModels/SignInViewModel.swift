//
//  SignInViewModel.swift
//  Stamps
//
//  Created by Nick Sadri on 4/4/25.
//

import Foundation
import FirebaseAuth

class SignInViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var passwordHidden = true
    
    func signIn() {
        Auth.auth().signIn(withEmail: self.email, password: self.password) { result, error in
            // TODO: proper error handling and displaying user-friendly error to UI instead of simple print statements
            if let error = error {
                print("Error signing in: \(error.localizedDescription)")
            } else {
                print("Successful sign in!")
            }
        }
    }
}
