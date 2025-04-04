//
//  ForgotPasswordViewModel.swift
//  Stamps
//
//  Created by Nick Sadri on 4/4/25.
//

import Foundation
import FirebaseAuth

class ForgotPasswordViewModel: ObservableObject {
    @Published var forgottenEmail = ""
    
    // TODO: currently, Firebase's password reset link allows users to change their passwords to ones that do not abide by the secure password policy. Find a solution to this issue.
    func resetPassword() {
        Auth.auth().sendPasswordReset(withEmail: forgottenEmail) { error in
            // TODO: proper error handling and displaying user-friendly error to UI instead of simple print statements
            if let error = error {
                print("Error sending password reset email: \(error.localizedDescription)")
            } else {
                print("Password reset email sent successfully!")
            }
        }
    }
}
