//
//  AboutView.swift
//  Bullseye
//
//  Created by Tissiana Alves on 6/19/20.
//  Copyright © 2020 Tissiana Alves. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    
    let purplehaze = Color(red: 125.0 / 255.0, green: 112.0 / 255.0, blue: 152.0 / 255.0)
    
    struct AboutHeadingStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 30))
                .padding(.top, 20)
                .padding(.bottom, 20)
        }
    }
    
    struct AboutBodyStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 16))
                .padding(.leading, 60)
                .padding(.trailing, 60)
                .padding(.bottom, 20)
                .listStyle(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=List Style@*/DefaultListStyle()/*@END_MENU_TOKEN@*/)
        }
    }
    
    var body: some View {
        Group {
            VStack {
                Text("🦋 Zen Target 🦋").modifier(AboutHeadingStyle())
                Text("This is Zen Target, the game where you can win points by dragging a slider.").modifier(AboutBodyStyle())
                Text("Your goal is to place the slider as close as possible to the target. The closer you are, the more points you score.").modifier(AboutBodyStyle()).multilineTextAlignment(.center)
                Text("Enjoy!").modifier(AboutBodyStyle())
            }
            .background(purplehaze)
        }
    .background(Image("Background"))
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView().previewLayout(.fixed(width: 896, height: 414))
    }
}
