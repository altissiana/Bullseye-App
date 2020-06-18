//
//  ContentView.swift
//  Bullseye
//
//  Created by Tissiana Alves on 6/17/20.
//  Copyright © 2020 Tissiana Alves. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            // target row
            HStack {
                Text("Put the bullseye as close as you can to:")
                Text(/*@START_MENU_TOKEN@*/"100"/*@END_MENU_TOKEN@*/)
            }
            Spacer()
            // slider row
            HStack {
                Text("1")
                Slider(value: .constant(10))
                Text("100")
            }
            Spacer()
            // button row
            Button(action: {
                print("Button pressed!")
                self.alertIsVisible = true
            }) {
                Text(/*@START_MENU_TOKEN@*/"Hit Me!"/*@END_MENU_TOKEN@*/)
            }
            .alert(isPresented: $alertIsVisible) { () ->
                Alert in
                return Alert(title: Text("Hello there!"),
                             message: Text("This is my first pop-up."),
                             dismissButton: .default(Text("Awesome")))
            }
            Spacer()
            //score row
            HStack {
                Button(action: {}) {
                    Text("Start Over")
                }
                Spacer()
                Text("Score:")
                Text("999999")
                Spacer()
                Text("Round:")
                Text("999")
                Spacer()
                Button(action: {}) {
                    Text("Info")
                }
            }
            .padding(.bottom, 20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(
            .fixed(width: 896, height: 414))
    }
}
