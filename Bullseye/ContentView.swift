//
//  ContentView.swift
//  Bullseye
//
//  Created by Tissiana Alves on 6/17/20.
//  Copyright © 2020 Tissiana Alves. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Welcome to my app!")
                .fontWeight(.semibold)
                .foregroundColor(Color.gray)
            Button(action: {
                print("Button pressed!")
            }) {
                Text(/*@START_MENU_TOKEN@*/"Hit Me!"/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
