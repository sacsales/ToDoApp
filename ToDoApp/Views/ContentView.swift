//
//  ContentView.swift
//  ToDoApp
//
//  Created by Sabrina C. Sales on 27/07/2023.
// main view 

import SwiftUI

struct ContentView: View {
    
    @StateObject var todoManager = TodoManager()
   
    
    
    var body: some View {
        TabView {
            MainTodoListView(todoManager: todoManager)
                .tabItem {
                    Label("Todos", systemImage: "checkmark.circle.fill")
                }
                .badge(todoManager.numTodosNotDone)
            HowManyMoreView(todoManager: todoManager)
                .tabItem {
                    Label("How Many?", systemImage: "number")
                }
                
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
