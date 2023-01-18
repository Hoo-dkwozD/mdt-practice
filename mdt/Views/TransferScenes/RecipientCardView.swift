//
//  RecipientCardView.swift
//  mdt
//
//  Created by Derrick Hoon on 13/1/23.
//

import SwiftUI

struct RecipientCardView: View {
    let topText: String
    let bottomText: String
    let backgroundColors: [Color]
    let textColor: Color
    let isFilled: Bool
    
    var body: some View {
        if (backgroundColors.count == 0) {
            VStack(alignment: .leading) {
                HStack {
                    Text(topText)
                    Spacer()
                }
                    .overlay(
                        Rectangle()
                        .stroke(textColor)
                        .background(textColor)
                        .frame(height: isFilled ? 0 : 1)
                        .padding(.top, 30)
                    )
                    .padding(.vertical, 10)
                HStack {
                    Text(bottomText)
                    Spacer()
                }
                    .overlay(
                        Rectangle()
                        .stroke(textColor)
                        .background(textColor)
                        .frame(height: isFilled ? 0 : 1)
                        .padding(.top, 30)
                    )
                    .padding(.vertical, 10)
            }
            .padding(.vertical, 15)
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity)
            .foregroundColor(isFilled ? textColor : textColor.opacity(0.65))
            .background(Theme.white.mainColor)
            .cornerRadius(20)
        } else if (backgroundColors.count == 1) {
            VStack(alignment: .leading) {
                HStack {
                    Text(topText)
                    Spacer()
                }
                    .overlay(
                        Rectangle()
                        .stroke(textColor)
                        .background(textColor)
                        .frame(height: isFilled ? 0 : 1)
                        .padding(.top, 30)
                    )
                    .padding(.vertical, 10)
                HStack {
                    Text(bottomText)
                    Spacer()
                }
                    .overlay(
                        Rectangle()
                        .stroke(textColor)
                        .background(textColor)
                        .frame(height: isFilled ? 0 : 1)
                        .padding(.top, 30)
                    )
                    .padding(.vertical, 10)
            }
            .padding(.vertical, 15)
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity)
            .foregroundColor(isFilled ? textColor : textColor.opacity(0.65))
            .background(backgroundColors[0])
            .cornerRadius(20)
        } else {
            VStack(alignment: .leading) {
                HStack {
                    Text(topText)
                    Spacer()
                }
                    .overlay(
                        Rectangle()
                        .stroke(textColor)
                        .background(textColor)
                        .frame(height: isFilled ? 0 : 1)
                        .padding(.top, 30)
                    )
                    .padding(.vertical, 10)
                HStack {
                    Text(bottomText)
                    Spacer()
                }
                    .overlay(
                        Rectangle()
                        .stroke(textColor)
                        .background(textColor)
                        .frame(height: isFilled ? 0 : 1)
                        .padding(.top, 30)
                    )
                    .padding(.vertical, 10)
            }
            .padding(.vertical, 15)
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity)
            .foregroundColor(isFilled ? textColor : textColor.opacity(0.65))
            .background(
                LinearGradient(gradient: Gradient(colors: backgroundColors), startPoint: .bottomLeading, endPoint: .topTrailing)
            )
            .cornerRadius(20)
        }
    }
}

struct RecipientCardView_Previews: PreviewProvider {
    static var previews: some View {
        RecipientCardView(topText: "one", bottomText: "two", backgroundColors: [Theme.failureRed.mainColor, Theme.successGreen.mainColor], textColor: Theme.white.mainColor, isFilled: false)
    }
}
