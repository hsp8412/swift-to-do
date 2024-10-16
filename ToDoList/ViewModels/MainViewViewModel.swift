//
//  MainViewViewModel.swift
//  ToDoList
//
//  Created by 何斯鹏 on 2024-09-13.
//

import Foundation
import FirebaseAuth

class MainViewViewModel: ObservableObject {
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?

    init() {
        self.handler = AuthService.shared.addAuthStateChangeListener { [weak self] userId in
            self?.currentUserId = userId ?? ""
        }
    }

    public var isSignedIn: Bool {
        return AuthService.shared.isSignedIn()
    }
}

