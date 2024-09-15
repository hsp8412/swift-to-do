//
//  RegisterView.swift
//  ToDoList
//
//  Created by 何斯鹏 on 2024-09-13.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    var body: some View {
        VStack{
            //Header
            HeaderView(title:"Register",
                       subtitle: "Start organizing todos",
                       angle: -15,
                       background:.orange
            )
            
            //Form
            Form{
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email Address", text:$viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                SecureField("Password", text:$viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                TLButton(title: "Create Account", background: .green){
                    //Attempt registration
                    viewModel.register()
                }
            }
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
