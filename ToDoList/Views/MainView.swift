//
//  ContentView.swift
//  ToDoList
//
//  Created by 何斯鹏 on 2024-09-13.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty{
            // signed in
            ToDoListView()
        }else{
            LoginView()
        }
    }
}

#Preview {
    MainView()
}
