//
//  GeneralSecureFieldView.swift
//  mdt
//
//  Created by Derrick Hoon on 12/1/23.
//

import SwiftUI

struct GeneralSecureFieldView: View {
    let label: String
    let labelColor: Color
    let textColor: Color
    let borderColor: Color
    
    @FocusState private var isEditing: Bool
    
    @Binding var value: String
    
    var isMovePlaceholder: Bool {
        isEditing || (value.count != 0)
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            Text(label)
                .foregroundColor(labelColor)
                .offset(y: isMovePlaceholder ? -25 : 0)
                .scaleEffect(isMovePlaceholder ? 0.75 : 1, anchor: .leading)
                .animation(.spring(response: 0.4, dampingFraction: 0.3), value: isMovePlaceholder)
            HStack {
                SecureField("", text: $value)
                    .focused($isEditing)
                    .foregroundColor(textColor)
            }
            .overlay(Rectangle().stroke(borderColor).background(borderColor).frame(height: 1).padding(.top, 35))
        }
        .padding(20)
    }
}

struct GeneralSecureFieldView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralSecureFieldView(label: "Question", labelColor: Theme.black.mainColor.opacity(0.8), textColor: Theme.darkBlue.mainColor, borderColor: Theme.black.mainColor.opacity(0.5), value: .constant(""))
    }
}
