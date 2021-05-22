//
//  ContentView.swift
//  Binding-Demo
//
//  Created by Ankit Jaiswal on 21/05/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var name: String = "ABC"
    
    var body: some View {
        let _ = print("rendered 1")
        
        VStack {
            SimpleView()
            Text(name)
                .padding()
            CustomTextField(name: $name)
        }
    }
}

struct CustomTextField: View {
    
    @Binding var name: String
    
    var body: some View {
        let _ = print("rendered 2")
        
        TextField("Username", text: $name)
    }
}

struct SimpleView: View {
    var body: some View {
        let _ = print("rendered 3")
        
        Text("1")
        Text("2")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
