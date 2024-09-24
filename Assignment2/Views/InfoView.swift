//
//  Identity.swift
//  Assignment2
//
//  Created by Chenghou Si on 2024-09-24.
//

import SwiftUI

struct InfoView: View {
    enum Field: Hashable {
        case name, number
    }

    @State private var name: String = ""
    @State private var printName: String = "No name typed in yet"
    @State private var number: Float? = nil
    @State private var printNum: String = "No number typed in yet"
    @FocusState private var focusField: Field?
    
    let space: CGFloat

    var body: some View {
        VStack (spacing: space) {
            HStack {
                Text("Name:")
                    .frame(width: 70, alignment: .trailing)
                    .padding(.trailing)

                TextField("Type in a name", text: $name)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.default)
                    .submitLabel(.done)
                    .onSubmit {
                        printName = name == "" ? "Name field has been cleared." : "Hello, \(name)"
                    }
            }
            
            HStack {
                Text("Number:")
                    .frame(width: 70, alignment: .trailing)
                    .padding(.trailing)
                
                TextField("Type in a number", value: $number, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad)
                    .focused($focusField, equals: .number)
                
                Button("Set Number") {
                    focusField = nil
                    printNum = number == nil ? "Number field has been cleared." : "The entered number is: \(String(number!))"
                }
                .buttonStyle(.borderedProminent)
                .tint(Color.orange)
            }
            
            
            Text(printName)
                .font(Font.custom("American Typewriter", size: 20))

            Text(printNum)
                .font(Font.custom("American Typewriter", size: 20))

        }
        .padding()
    }
}

#Preview {
    InfoView(space: 20)
}
