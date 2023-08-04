//
//  TodoRowView.swift
//  ToDoApp
//
//  Created by Sabrina C. Sales on 29/07/2023.
//

import SwiftUI

struct TodoRowView: View {
    
    
    @Binding var todo: Todo
    
    
    var body: some View {
        
        if !todo.isCompleted {
        NavigationLink {
            TodoDetailView(todo: $todo)
        } label: {
            VStack {
                
                    HStack {
                        Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                            
                            .onTapGesture {
                                withAnimation {
                                    
                                    todo.isCompleted.toggle()
                                }
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
        
        
    }
}

struct TodoRowView_Previews: PreviewProvider {
    static var previews: some View {
        TodoRowView(todo: .constant(Todo(title: "DemoTodo")))
    }
}
