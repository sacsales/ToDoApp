//
//  HowManyMoreView.swift
//  ToDoApp
//
//  Created by Sabrina C. Sales on 04/08/2023.
//

import SwiftUI

struct HowManyMoreView: View {
    
    @ObservedObject var todoManager: TodoManager
    
    
    
    var body: some View {
        VStack {
            Text("You have:")
                .font(.system(.title))
                .padding()
            Text("\(todoManager.numTodosNotDone)")
                .font(.system(size: 70))
                .padding()
                .bold()
                .foregroundColor(.blue)
            Text("Todos left")
                .font(.system(.title))
                .padding()
            Text("You have completed ^[\(todoManager.numTodosDone) todos](inflect:true). Great job!")
            
        }
       
    }
}

struct HowManyMoreView_Previews: PreviewProvider {
    static var previews: some View {
        HowManyMoreView(todoManager: TodoManager())
    }
}
