//
//  GeneralBackgroundView.swift
//  mdt
//
//  Created by Derrick Hoon on 13/1/23.
//

import SwiftUI

struct GeneralBackgroundView<Content: View>: View {
    @State var isLoading = false
    
    @ViewBuilder var content: (Binding<Bool>) -> Content
    
    var body: some View {
        ZStack {
            content($isLoading)
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 40)
            if (isLoading) {
                VStack {
                    Spacer()
                    Text("Loading... ")
                        .foregroundColor(Theme.white.mainColor)
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .background(Theme.gray.mainColor.opacity(0.8))
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .background(Theme.base.mainColor)
    }
}

struct GeneralBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GeneralBackgroundView { isLoading in
                Text("Test")
            }
        }
    }
}
