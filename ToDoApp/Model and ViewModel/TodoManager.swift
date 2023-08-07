//
//  TodoManager.swift
//  ToDoApp
//
//  Created by Sabrina C. Sales on 31/07/2023.
// source of truth. 

import Foundation
import SwiftUI


class TodoManager: ObservableObject {
    
    @Published var todos: [Todo] = [] {
        didSet {
            save()
        }
    }
    
    
    @Published var searchTerm = ""
    
    var todosFiltered: Binding<[Todo]> {
            Binding (
                get: {
                    if self.searchTerm == "" { return self.todos }
                    return self.todos.filter {
                        $0.title.lowercased().contains(self.searchTerm.lowercased())
                    }
                },
                set: {
                    self.todos = $0
                }
            )
        }
    
   
    
    var todosSorted: Binding<[Todo]> {
        Binding(
            get: {
                return self.todos.sorted { $0.title.lowercased() < $1.title.lowercased() }
            }, set: {
                self.todos = $0
            }
        
        )
    }

    var numTodosDone: Int {
        todos.filter { $0.isCompleted}.count
    }
    
    var numTodosNotDone: Int {
        todos.filter { !$0.isCompleted}.count
    }
        
    init() {
        load()
    }
    
    func loadSampleData() {
        todos = Todo.sampleTodos
    }
    
    func getArchiveURL() -> URL {
        let plistName = "todos.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedTodos = try? propertyListEncoder.encode(todos)
        try? encodedTodos?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
                
        if let retrievedTodoData = try? Data(contentsOf: archiveURL),
            let todosDecoded = try? propertyListDecoder.decode([Todo].self, from: retrievedTodoData) {
            todos = todosDecoded
        }
    }
}
