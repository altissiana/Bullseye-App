//
//  AboutView.swift
//  Bullseye
//
//  Created by Tissiana Alves on 6/19/20.
//  Copyright © 2020 Tissiana Alves. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    
    struct AboutHeadingStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 30))
                .padding(.top, 20)
                .padding(.bottom, 20)
        }
    }
    
    var body: some View {
        VStack {
            Text("🦋 Zen Target 🦋")
            Text("This is Zen Target, the game where you can win points by dragging a slider.")
            Text("Your goal is to place the slider as close as possible to the target. The closer you are, the more points you score.")
            Text("Enjoy!")
        }
        .navigationBarTitle("About Zen Target")
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView().previewLayout(.fixed(width: 896, height: 414))
    }
}
