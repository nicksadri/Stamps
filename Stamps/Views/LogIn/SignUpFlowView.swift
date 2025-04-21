//
//  SignUpFlowView.swift
//  Stamps
//
//  Created by Nick Sadri on 4/4/25.
//

import SwiftUI

struct SignUpFlowView: View {
    
    @StateObject private var viewModel = SignUpViewModel()
    
    var body: some View {
        NavigationStack {
            SignUpEmailView(signUpViewModel: viewModel)
        }
    }
}

#Preview {
    SignUpFlowView()
}
