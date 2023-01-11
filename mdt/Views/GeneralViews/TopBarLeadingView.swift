//
//  TopBarLeadingView.swift
//  mdt
//
//  Created by Derrick Hoon on 9/1/23.
//

import SwiftUI

struct TopBarLeadingView: View {
    var btnAction: () -> Void
    var btnIcon: String
    var barText: String
    
    var body: some View {
        HStack {
            TopButtonView(buttonAction: btnAction, buttonIconName: btnIcon)
                .padding(.trailing, 5)
            Spacer()
            Text(barText)
                .font(.title)
                .fontWeight(.bold)
                .padding(.leading, 5)
        }
    }
    
    init(buttonAction btnAction: @escaping () -> Void, buttonIconName btnIcon: String, barText: String) {
        self.btnAction = btnAction
        self.btnIcon = btnIcon
        self.barText = barText
    }
}

struct TopBarLeadingView_Previews: PreviewProvider {
    static var previews: some View {
        TopBarLeadingView(buttonAction: {}, buttonIconName: "BackArrow", barText: "Test")
    }
}
