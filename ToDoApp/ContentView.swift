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
        Todo(title: "complete unit 8", subtitle: "subtitle"),
        Todo(title: "research mics"),
    ]
    
    
    var body: some View {
        
        NavigationStack {
            List($todos, id: \.id) { $todo in
                NavigationLink {
                    TodoDetailView(todo: $todo)
                } label: {
                    VStack {
                        HStack {
                            Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                                .onTapGesture {
                                    todo.isCompleted.toggle()
                                }
                            VStack(alignment: .leading) {
                                Text(todo.title)
                                    .strikethrough(todo.isCompleted)
                                if !todo.subtitle.isEmpty {
                                    Text(todo.subtitle)
                                        .foregroundColor(.gray)
                                        .font(.footnote)
                                        .strikethrough(todo.isCompleted)
                                }
                            }
                            
                        }
                        
                    }
                }
               
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
