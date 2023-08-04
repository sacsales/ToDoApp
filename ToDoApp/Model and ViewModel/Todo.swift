//
//  Todo.swift
//  ToDoApp
//
//  Created by Sabrina C. Sales on 27/07/2023.
// todo struct

import Foundation

struct Todo: Identifiable, Codable {
    var id = UUID()
    var title: String
    var subtitle = ""
    var isCompleted = false
   
    
}

