//
//  SignInViewModel.swift
//  Stamps
//
//  Created by Nick Sadri on 4/4/25.
//

import Foundation

class SignInViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var passwordHidden = true
}
