//
//  LoginView.swift
//  ToDoList
//
//  Created by 何斯鹏 on 2024-09-13.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    var body: some View {
        NavigationView{
            VStack{
                // Header
                HeaderView(title:"To Do List",
                subtitle: "Get things done",
                           angle: 15,
                           background:.pink
                )
                
                // Login Form
                Form{
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    TextField("Email Address", text:$viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(title: "Log In", background: .blue){
                        viewModel.login()
                    }
                }
                
                // Create Account
                VStack{
                    Text("New around here?")
                    NavigationLink("Create An Account", destination: RegisterView())
                }
                Spacer()
            }
        }
        
    }
}

#Preview {
    LoginView()
}
