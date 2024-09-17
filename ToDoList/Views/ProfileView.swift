//
//  ProfileView.swift
//  ToDoList
//
//  Created by 何斯鹏 on 2024-09-13.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    var body: some View {
        NavigationView{
            VStack{
                if let user = viewModel.user {
                    profile(user:user)
                }
                else{
                    Text("Loading Profile...")
                }
                Spacer()
            }
            .navigationTitle("Profile")
        }
        .onAppear{
            viewModel.fetchUser()
        }
        
    }
    
    @ViewBuilder
    func profile(user:User) -> some View {
        //Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.blue)
            .frame(width: 125,height: 125)
            .padding()
        // Info: Name, Email, Member since
        VStack(alignment: .leading, content: {
            HStack{
                Text("Name: ")
                    .bold()
                Text(user.name)
            }
            .padding()
            HStack{
                Text("Email: ")
                    .bold()
                Text(user.email)
            }
            .padding()
            HStack{
                Text("Member Since: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date:.abbreviated, time:.shortened))")
            }
            .padding()
        }).padding()
        // Log out
        Button("Log Out"){
            viewModel.logout()
        }.tint(.red)
            .padding()
    }
}

#Preview {
    ProfileView()
}
