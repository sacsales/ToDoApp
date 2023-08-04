//
//  MainTodoListView.swift
//  ToDoApp
//
//  Created by Sabrina C. Sales on 04/08/2023.
//

import SwiftUI

struct MainTodoListView: View {
    
   
    @ObservedObject var todoManager: TodoManager
    @State private var showSheet = false
    @State private var showAlert = false
    
    
    var body: some View {
        NavigationStack {
            
            List(todoManager.todosSorted, editActions: [.all]) { $todo in
                TodoRowView(todo: $todo)
            }
            .searchable(text: $todoManager.searchTerm)
            
            .navigationTitle("Todos")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showAlert = true
                    } label: {
                        Image(systemName: "clipboard.fill")
                    }
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
                AddTodoView(sourceArray: $todoManager.todos)
                    .presentationDetents([.medium])
                    
            }
            
            .alert("Load sample data? Warning: This overrides your existing todos and cannot be undone!", isPresented: $showAlert) {
               
                Button (role: .destructive){
                    todoManager.loadSampleData()
                } label : {
                    Text("Proceed")
                }
               
                
            }
        }
    }
}

struct MainTodoListView_Previews: PreviewProvider {
    static var previews: some View {
        MainTodoListView(todoManager: TodoManager())
    }
}
