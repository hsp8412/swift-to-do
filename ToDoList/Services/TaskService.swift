//
//  TaskService.swift
//  ToDoList
//
//  Created by 何斯鹏 on 2024-10-16.
//

import FirebaseFirestore
import Foundation

class TaskService {
    static let shared = TaskService()
    private let db = Firestore.firestore()
    
    private init() {}
    
    func fetchToDoItems(for userId: String, completion: @escaping ([ToDoListItem]?) -> Void) {
        db.collection("users")
            .document(userId)
            .collection("todos")
            .addSnapshotListener { snapshot, error in
                guard let documents = snapshot?.documents, error == nil else {
                    completion(nil)
                    return
                }
                
                let items = documents.compactMap { doc -> ToDoListItem? in
                    try? doc.data(as: ToDoListItem.self)  // Assuming you have a model for ToDoListItem conforming to Codable
                }
                completion(items)
            }
    }
}
