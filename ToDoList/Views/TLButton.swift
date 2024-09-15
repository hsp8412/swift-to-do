//
//  TLButton.swift
//  ToDoList
//
//  Created by 何斯鹏 on 2024-09-14.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    let action: ()->Void
    var body: some View {
        Button{
            // Action
            action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
        .padding()
    }
}

#Preview {
    TLButton(title:"Value", 
             background: .blue){
        // action
    }
}
