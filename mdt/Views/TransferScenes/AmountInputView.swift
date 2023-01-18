//
//  AmountInputView.swift
//  mdt
//
//  Created by Derrick Hoon on 17/1/23.
//

import SwiftUI

struct AmountInputView: View {
    @State private var textRect = CGRect()
    
    @FocusState private var isEditingAmt: Bool
    
    @Binding var balance: Double
    @Binding var amtAsString: String
    @Binding var isPresentDesc: Bool
    
    var inputDefaultText: String
    
    var amtAsDouble: Double {
        return Double(amtAsString) ?? 0.0
    }

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Available: ")
                Text(
                    String(format: "SGD %.2f", balance)
                )
                    .fontWeight(.bold)
                Spacer()
            }
            HStack {
                Spacer()
                Text("SGD ")
                    .font(.title.bold())
                ZStack {
                    Text(amtAsDouble == 0.0 ? inputDefaultText : String(format: "%.2f", amtAsDouble))
                        .font(.title.bold())
                        .foregroundColor(amtAsDouble > balance ? Theme.failureRed.mainColor : Theme.black.mainColor)
                        .background(
                            GlobalGeometryGetter(rect: $textRect)
                        )
                        .layoutPriority(1.0)
                    HStack {
                        TextField(inputDefaultText, text: $amtAsString)
                            .frame(width: textRect.width)
                            .font(.title.bold())
                            .keyboardType(.numberPad)
                            .foregroundColor(.clear)
                            .disableAutocorrection(true)
                            .focused($isEditingAmt)
                            .overlay(
                                Rectangle()
                                    .stroke(
                                        Theme.black.mainColor.opacity(0.3)
                                    )
                                    .background(
                                        Theme.black.mainColor.opacity(0.3)
                                    )
                                    .frame(width: textRect.width, height: (isEditingAmt || (amtAsDouble != 0.0)) ? 0 : 1)
                                    .padding(.top, 30)
                            )
                    }
                }
                Spacer()
            }
        }
        .onChange(of: amtAsDouble) { newValue in
            isPresentDesc = (newValue > 0.0)
        }
    }
}

struct AmountInputView_Previews: PreviewProvider {
    static var previews: some View {
        AmountInputView(balance: .constant(9_000.0), amtAsString: .constant(""), isPresentDesc: .constant(false), inputDefaultText: "   ")
    }
}
