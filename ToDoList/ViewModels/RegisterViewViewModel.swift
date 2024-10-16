//
//  RegisterViewViewModel.swift
//  ToDoList
//
//  Created by 何斯鹏 on 2024-09-13.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    func register() {
        guard validate() else {
            return
        }
        
        AuthService.shared.registerUser(withEmail: email, password: password, name: name) { [weak self] userId in
            if userId == nil {
                // Handle registration failure, perhaps set an error message
                self?.errorMessage = "Registration failed"
                print("Registration failed")
                return
            }
            // Handle successful registration if needed (e.g., UI updates)
        }
    }
    
    private func validate() -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            return false
        }
        
        guard password.count >= 6 else {
            return false
        }
        
        return true
    }
}
