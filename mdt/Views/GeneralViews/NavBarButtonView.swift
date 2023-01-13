//
//  NavBarButtonView.swift
//  mdt
//
//  Created by Derrick Hoon on 13/1/23.
//

import SwiftUI

struct NavBarButtonView: View {
    var btnAction: () -> Void
    var btnIcon: String
    var btnColor: [Theme]
    
    var body: some View {
        Button(action: btnAction) {
            if (btnColor.count == 0) {
                Image(btnIcon)
                    .foregroundColor(Theme.base.accentColor)
                    .frame(height: 45)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Theme.base.mainColor)
                    )
                    .padding(.vertical, 20)
                    .padding(.horizontal, 10)
            } else if (btnColor.count == 1) {
                Image(btnIcon)
                    .foregroundColor(btnColor[0].accentColor)
                    .frame(height: 45)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(btnColor[0].mainColor)
                    )
                    .padding(.vertical, 20)
                    .padding(.horizontal, 10)
            } else {
                Image(btnIcon)
                    .foregroundColor(btnColor[0].accentColor)
                    .frame(height: 45)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(
                                        colors: btnColor.map({ theme in theme.mainColor })
                                    ),
                                    startPoint: .bottomLeading,
                                    endPoint: .topTrailing
                                )
                            )
                    )
                    .padding(.vertical, 20)
                    .padding(.horizontal, 10)
            }
        }
    }
    
    init(buttonAction btnAction: @escaping () -> Void, buttonIconName btnIcon: String, btnBackgroundColor btnColor: [Theme]) {
        self.btnAction = btnAction
        self.btnIcon = btnIcon
        self.btnColor = btnColor
    }
}

struct NavBarButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NavBarButtonView(buttonAction: {}, buttonIconName: "Transfer", btnBackgroundColor: [Theme.lightBlue, Theme.blue])
    }
}
