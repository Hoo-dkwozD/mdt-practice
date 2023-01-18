//
//  TransferDescriptionView.swift
//  mdt
//
//  Created by Derrick Hoon on 17/1/23.
//

import SwiftUI

struct TransferDescriptionView: View {
    @State private var textRect = CGRect()
    
    @Binding var description: String
    
    var colors: [Color]
    
    var body: some View {
        VStack {
            ZStack {
                TextEditor(text: $description)
                    .background(
                        LinearGradient(gradient: Gradient(colors: colors), startPoint: .bottomLeading, endPoint: .topTrailing)
                    )
                    .frame(minWidth: 100, minHeight: 100)
                Text(description)
                    .opacity(0.0)
                    .background(
                        GlobalGeometryGetter(rect: $textRect)
                    )
                    .layoutPriority(1.0)
            }
        }
    }
}

struct TransferDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        TransferDescriptionView(description: .constant(""), colors: [Theme.cyan.mainColor, Theme.darkCyan.mainColor])
    }
}
