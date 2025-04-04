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
    
    func isValidEmail() -> Bool {
        let regex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: self.email)
    }
    
    func passwordIsLongEnough() -> Bool {
        let lengthRange = 8...20
        
        return lengthRange.contains(self.password.count)
    }
    
    func passwordIsComplexEnough() -> Bool {
        let letterRegex = ".*[A-Za-z]+.*"
        let numberRegex = ".*[0-9]+.*"
        let specialCharRegex = ".*[!@#$%^&*(),.?\":{}|<>\\[\\]~`_+=\\-]+.*"

        let letterTest = NSPredicate(format:"SELF MATCHES %@", letterRegex)
        let numberTest = NSPredicate(format:"SELF MATCHES %@", numberRegex)
        let specialTest = NSPredicate(format:"SELF MATCHES %@", specialCharRegex)

        return letterTest.evaluate(with: password) && numberTest.evaluate(with: password) && specialTest.evaluate(with: password)
    }
}
