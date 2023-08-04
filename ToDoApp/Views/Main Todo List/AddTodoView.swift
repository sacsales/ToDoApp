//
//  AddTodoView.swift
//  ToDoApp
//
//  Created by Sabrina C. Sales on 29/07/2023.
//

import SwiftUI

struct AddTodoView: View {
    
    @State private var title = ""
    @State private var subtitle = ""
    @State private var showTitleWarning = false
    @State private var showSaveWarning = false
   
    @Binding var sourceArray: [Todo]
    @Environment(\.dismiss) var goAway
    
    func save() {
        let todo = Todo(title: title, subtitle: subtitle)
        sourceArray.append(todo)
        goAway()
    }
    var body: some View {
        Form {
            TextField("Title", text: $title)
            TextField("Subtitle", text: $subtitle)
            Section {
                Button("Save") {
                    if title.isEmpty {
                        showTitleWarning = true
                    } else {
                        save()
                    }
                }
                
                Button("Cancel", role: .destructive) {
                    goAway()
                }
            }
        }
        .alert("Hey! You might want to add a title for that...", isPresented: $showTitleWarning) {
            Button {
                showTitleWarning = false
            } label: {
                Text("Ok")
            }
        }
        .alert("Hey! Do you want to save your todo?", isPresented: $showSaveWarning) {
            Button {
                showSaveWarning = false
            } label: {
                Text("Nah.")
            }
            Button {
                save()
            } label: {
                Text("Yep!")
            }
        }
        
        .onDisappear {
            print("bye bye")
            
            if !title.isEmpty {
                showSaveWarning = true
            }
        }
        
    }
    
      
}

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView(sourceArray: .constant([]))
    }
}
