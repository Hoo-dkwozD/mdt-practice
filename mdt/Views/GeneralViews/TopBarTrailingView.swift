//
//  TopBarTrailingView.swift
//  mdt
//
//  Created by Derrick Hoon on 9/1/23.
//

import SwiftUI

struct TopBarTrailingView: View {
    var btnAction: () -> Void
    var btnIcon: String
    var barText: String
    
    var body: some View {
        HStack {
            Text(barText)
                .font(.title)
                .fontWeight(.bold)
                .padding(.trailing, 5)
            Spacer()
            TopButtonView(buttonAction: btnAction, buttonIconName: btnIcon)
                .padding(.leading, 5)
        }
    }
    
    init(buttonAction btnAction: @escaping () -> Void, buttonIconName btnIcon: String, barText: String) {
        self.btnAction = btnAction
        self.btnIcon = btnIcon
        self.barText = barText
    }
}

struct TopBarTrailingView_Previews: PreviewProvider {
    static var previews: some View {
        TopBarTrailingView(buttonAction: {}, buttonIconName: "Logout", barText: "Test")
    }
}

