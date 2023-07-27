//
//  Todo.swift
//  ToDoApp
//
//  Created by Sabrina C. Sales on 27/07/2023.
//

import Foundation

struct Todo: Identifiable {
    var id = UUID()
    var title: String
    var isCompleted = false
    
}
