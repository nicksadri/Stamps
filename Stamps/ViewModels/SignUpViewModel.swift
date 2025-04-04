//
//  File.swift
//  Stamps
//
//  Created by Nick Sadri on 3/27/25.
//

import Foundation
import FirebaseAuth

class SignUpViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func signUp(password: String) {
        print("email: \(self.email), password: \(password)")
        Auth.auth().createUser(withEmail: self.email, password: password) { authResult, error in
            // TODO: proper error handling and displaying user-friendly error to UI instead of simple print statements
            if let error = error {
                print("Error signing up: \(error.localizedDescription)")
            } else {
                print("Successful sign up!")
            }
        }
    }
}
