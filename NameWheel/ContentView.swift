//
//  ContentView.swift
//  NameWheel
//
//  Created by Ahmad Remote on 8/19/24.
//

import SwiftUI

class Names : ObservableObject
{
    var names : [String] = ["Bob", "Bill", "James", "Ahmad", "Poochega", "John", "Jacob", "Schmidt"]//[String]()
    func addName(_ name : String)
    {
        names.append(name)
    }
}

struct ContentView: View {
    @State var name : String
    @State var names : Names = Names()
    var body: some View {
        NavigationStack
        {
            VStack {
                Text("Enter list of names. Press done button when ready.")
                
                NavigationLink(destination: NameWheel()) {
                    Text("Wheel of Names")
                }
                
                
                TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: $name)
                    .padding()
                    .onSubmit {
                        if !name.isEmpty
                        {
                            $names.wrappedValue.addName(name)
                        }
                        name = ""
                        print("Submit button pressed")
                        print(names)
                    }
            }
            .padding()            
        }.environmentObject(names)
    }
}

#Preview {
    ContentView(name: "")
}
