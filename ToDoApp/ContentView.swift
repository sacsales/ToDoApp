//
//  ContentView.swift
//  ToDoApp
//
//  Created by Sabrina C. Sales on 27/07/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var todos = [
        Todo(title: "feed mittens"),
        Todo(title: "pick up bananas"),
        Todo(title: "complete unit 8"),
        Todo(title: "research mics"),
    ]
    
    
    var body: some View {
        
        NavigationStack {
            List(todos, id: \.id) { todo in
                Text(todo.title)
            }
            .navigationTitle("Todo")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
