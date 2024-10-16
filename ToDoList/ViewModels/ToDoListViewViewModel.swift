//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by 何斯鹏 on 2024-09-13.
//

import Foundation
import FirebaseFirestore

class ToDoListViewViewModel: ObservableObject{
    @Published var items: [ToDoListItem] = []
    @Published var showingNewItemView = false
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
        fetchToDoItems()
    }
    
    func fetchToDoItems() {
        TaskService.shared.fetchToDoItems(for: userId) { [weak self] items in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.items = items ?? []
            }
        }
    }
    
    func delete(id:String){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
