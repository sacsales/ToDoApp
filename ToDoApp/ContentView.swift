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
    
    @State private var showSheet = false
    
    var body: some View {
        
        NavigationStack {
            List($todos, editActions: [.all]) { $todo in
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
            
            .navigationTitle("Todos")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showSheet) {
                AddTodoView(sourceArray: $todos)
                    .presentationDetents([.medium])
            }
        }
    }
        
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
