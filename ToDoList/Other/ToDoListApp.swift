//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by 何斯鹏 on 2024-09-13.
//

import SwiftUI
import FirebaseCore

@main
struct ToDoListApp: App {
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
