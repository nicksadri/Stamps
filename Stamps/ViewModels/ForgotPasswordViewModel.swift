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
    
    func resetPassword() {
        Auth.auth().sendPasswordReset(withEmail: forgottenEmail) { error in
            if let error = error {
                print("Error sending password reset email: \(error.localizedDescription)")
            } else {
                print("Password reset email sent successfully!")
            }
        }
    }
}
