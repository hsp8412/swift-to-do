//
//  ToDoListView.swift
//  ToDoList
//
//  Created by 何斯鹏 on 2024-09-14.
//

import SwiftUI
import FirebaseFirestore

struct ToDoListView: View {
    @StateObject var viewModel:ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    init(userId:String){
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(items){
                    item in
                    ToDoListItemView(item:item)
                        .swipeActions{
                            Button("Delete"){
                                //Delete
                                viewModel.delete(id: item.id)
                            }
                            .tint(Color.red)
                        }
                }
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button{
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView){
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

#Preview {
    ToDoListView(userId: "I9HUwLRvRaTy5vU5h7gYf8r6qng1")
}
