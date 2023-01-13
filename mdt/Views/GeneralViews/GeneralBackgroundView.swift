//
//  GeneralBackgroundView.swift
//  mdt
//
//  Created by Derrick Hoon on 13/1/23.
//

import SwiftUI

struct GeneralBackgroundView<Content: View>: View {
    @ViewBuilder var content: Content
    
    var body: some View {
        ZStack {
            content
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 40)
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .background(Theme.base.mainColor)
    }
}

struct GeneralBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GeneralBackgroundView {
                Text("Test")
            }
        }
    }
}
