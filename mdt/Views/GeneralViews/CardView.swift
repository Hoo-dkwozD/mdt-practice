//
//  CardView.swift
//  mdt
//
//  Created by Derrick Hoon on 11/1/23.
//

import SwiftUI

struct CardView<Content: View>: View {
    let backgroundColors: [Color]
    let textColor: Color
    @ViewBuilder let content: Content
    
    var body: some View {
        if (backgroundColors.count == 0) {
            content
            .padding(10)
            .frame(maxWidth: .infinity)
            .foregroundColor(textColor)
            .background(Theme.white.mainColor)
            .cornerRadius(15)
        } else if (backgroundColors.count == 1) {
            content
            .padding(10)
            .frame(maxWidth: .infinity)
            .foregroundColor(textColor)
            .background(backgroundColors[0])
            .cornerRadius(15)
        } else {
            content
            .padding(10)
            .frame(maxWidth: .infinity)
            .foregroundColor(textColor)
            .background(
                LinearGradient(gradient: Gradient(colors: backgroundColors), startPoint: .bottomLeading, endPoint: .topTrailing)
            )
            .cornerRadius(15)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(backgroundColors: [Theme.blue.mainColor, Theme.failureRed.mainColor], textColor: Theme.blue.accentColor) {
            Text("Test")
        }
    }
}
