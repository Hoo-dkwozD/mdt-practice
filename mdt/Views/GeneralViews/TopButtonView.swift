//
//  TopLeftButtonView.swift
//  mdt
//
//  Created by Derrick Hoon on 9/1/23.
//

import SwiftUI

struct TopButtonView: View {
    var btnAction: () -> Void
    var btnIcon: String
    
    var body: some View {
        Button(action: btnAction) {
            Image(btnIcon)
                .foregroundColor(Theme.gray.accentColor)
                .frame(width: 45, height: 45)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Theme.gray.mainColor)
                        .shadow(color: Theme.black.mainColor.opacity(0.25), radius: 2, x: 3, y: 5)
                )
                .padding(.vertical, 10)
        }
    }
    
    init(buttonAction btnAction: @escaping () -> Void, buttonIconName btnIcon: String) {
        self.btnAction = btnAction
        self.btnIcon = btnIcon
    }
}

struct TopButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TopButtonView(buttonAction: {}, buttonIconName: "BackArrow")
    }
}
