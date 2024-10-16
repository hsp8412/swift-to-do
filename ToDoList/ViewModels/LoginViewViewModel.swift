//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by 何斯鹏 on 2024-09-13.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    func login() {
        guard validate() else {
            return
        }
        
        // Call AuthService to handle login
        AuthService.shared.loginUser(withEmail: email, password: password) { [weak self] result in
            switch result {
            case .success(let userId):
                // Handle successful login, userId contains the signed-in user's ID
                print("User logged in with ID: \(userId)")
                self?.errorMessage = ""
                // Navigate to the next view or update UI state
                
            case .failure(let error):
                // Handle login error
                self?.errorMessage = error.localizedDescription
            }
        }
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields"
            return false
        }
        
        // Basic email validation
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid email."
            return false
        }
        
        return true
    }
}
