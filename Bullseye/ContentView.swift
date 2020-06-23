//
//  ContentView.swift
//  Bullseye
//
//  Created by Tissiana Alves on 6/17/20.
//  Copyright © 2020 Tissiana Alves. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible = false
    @State var sliderValue = 50.0
    @State var target = Int.random(in: 1...100)
    @State var score = 0
    @State var round = 1
    
   
    
    struct LabelStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.white)
                .shadow(color: Color.gray, radius: 5, x: 2, y: 2)
                .font(Font.custom("Arial Rounded MT Bold", size: 20))
        }
    }
    
    struct ButtonLargeTextStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 20))
        }
    }
    
    struct ButtonSmallTextStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 14))
        }
    }
    
    struct ValueStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.gray)
                .shadow(color: Color.purple, radius: 5, x: 2, y: 2)
                .font(Font.custom("Arial Rounded MT Bold", size: 26))
        }
    }
    
    var body: some View {
        VStack {
            Spacer()
            // target row
            HStack {
                Text("Put the bullseye as close as you can to:").modifier(LabelStyle())
                Text("\(target)").modifier(ValueStyle())
            }
            Spacer()
            // slider row
            HStack {
                Text("1").modifier(LabelStyle())
                Slider(value: $sliderValue, in: 1...100).accentColor(Color.gray)
                Text("100").modifier(LabelStyle())
            }
            Spacer()
            // button row
            Button(action: {
                print("Button pressed!")
                self.alertIsVisible = true
            }) {
                Text(/*@START_MENU_TOKEN@*/"Hit Me!"/*@END_MENU_TOKEN@*/).modifier(ButtonLargeTextStyle())
            }
            .alert(isPresented: $alertIsVisible) { () ->
                Alert in
                return Alert(title: Text(alertTitle()),
                             message: Text(
                                "The slider's value is \(sliderValueRounded()).\n" +
                                "You scored \(pointsForCurrentRound()) points this round."
                    ), dismissButton: .default(Text("Awesome!")) {
                        self.score = self.score + self.pointsForCurrentRound()
                        self.target = Int.random(in: 1...100)
                        self.round = self.round + 1
                    })
            }
            .background(Image("Button"))
            Spacer()
            //score row
            HStack {
                Button(action: {
                    self.startNewGame()
                }) {
                    Text("Start Over").modifier(ButtonSmallTextStyle())
                }
                .background(Image("Button"))
                Spacer()
                Text("Score:").modifier(LabelStyle())
                Text("\(score)").modifier(ValueStyle())
                Spacer()
                Text("Round:").modifier(LabelStyle())
                Text("\(round)").modifier(ValueStyle())
                Spacer()
                NavigationLink(destination: AboutView()) {
                HStack {
                    Text("Info").modifier(ButtonSmallTextStyle())
                    }
                }
                .background(Image("Button"))
            }
            .padding(.bottom, 20).padding(.trailing,25)
        }
        .background(Image("Background"), alignment: .center)
    }
    
    func sliderValueRounded() -> Int {
        Int(sliderValue.rounded())
    }
    func amountOff() -> Int {
        abs(target - sliderValueRounded())
    }
    
    func pointsForCurrentRound() -> Int {
        let maximumScore = 100
        let difference = amountOff()
        let bonus: Int
        if difference == 0 {
            bonus = 100
        } else if difference == 1 {
            bonus = 50
        } else {
            bonus = 0
        }
        return maximumScore - difference + bonus
    }
    
    func alertTitle() -> String {
        let difference = amountOff()
        let title: String
        if difference == 0 {
            title = "Perfect!"
        } else if difference < 5 {
            title = "You almost had it!"
        } else if difference <= 10 {
            title = "Not bad."
        } else {
            title = "Are you even trying?"
        }
        return title
    }
    
    func startNewGame() {
        score = 0
        round = 1
        sliderValue = 50.0
        target = Int.random(in: 1...100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
