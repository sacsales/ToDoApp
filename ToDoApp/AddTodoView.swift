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
    @Binding var sourceArray: [Todo]
    @Environment(\.dismiss) var goAway
    var body: some View {
        Form {
            TextField("Title", text: $title)
            TextField("Subtitle", text: $subtitle)
            Section {
                Button("Save") {
                    let todo = Todo(title: title, subtitle: subtitle)
                    sourceArray.append(todo)
                    goAway()
                }
                
                Button("Cancel", role: .destructive) {
                    goAway()
                }
            }
        }
    }
}

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView(sourceArray: .constant([]))
    }
}
