//
//  PreviewBottomButtonLastView.swift
//  mdt
//
//  Created by Derrick Hoon on 6/1/23.
//

import SwiftUI

struct BottomButtonView: View {
    @State private var isActiveTopBtn: Bool = false
    @State private var isActiveBottomBtn: Bool = false
    
    @Binding var targetIndex: CarouselIndex
    
    let btnColor: Theme
    var isDisabled: Bool = false
    let bottomBtnText: String
    let bottomBtnAction: () -> Void
    let bottomLinkText: String?
    let bottomLinkAction: () -> Void
    
    var body: some View {
        VStack {
            NavigationLink(destination: LoginView(), isActive: $isActiveTopBtn) {
                EmptyView()
            }
            NavigationLink(destination: RegistrationView(), isActive: $isActiveBottomBtn) {
                EmptyView()
            }
            if !isDisabled {
                if isLast() {
                    Button(action: { isActiveTopBtn = true; bottomBtnAction() }) {
                        Text(bottomBtnText)
                            .foregroundColor(btnColor.accentColor)
                            .frame(maxWidth: .infinity)
                            .padding(8)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(btnColor.mainColor)
                                    .shadow(color: Theme.black.mainColor.opacity(0.25), radius: 2, x: 3, y: 5)
                            )
                            .padding(.vertical, 10)
                    }
                    .padding(.horizontal, 30)
                    Button(action: { isActiveBottomBtn = true; bottomLinkAction() }) {
                        Text(bottomLinkText!)
                            .foregroundColor(btnColor.mainColor)
                            .underline()
                            .frame(maxWidth: .infinity)
                    }
                } else {
                    Button(action: { withAnimation { targetIndex.forward(); bottomBtnAction() } }) {
                        Text(bottomBtnText)
                            .foregroundColor(btnColor.accentColor)
                            .frame(maxWidth: .infinity)
                            .padding(8)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(btnColor.mainColor)
                                    .shadow(color: Theme.black.mainColor.opacity(0.25), radius: 2, x: 3, y: 5)
                            )
                            .padding(.vertical, 10)
                    }.padding(30)
                }
            } else {
                if isLast() {
                    Button(action: { isActiveTopBtn = true; bottomBtnAction() }) {
                        Text(bottomBtnText)
                            .foregroundColor(btnColor.accentColor)
                            .frame(maxWidth: .infinity)
                            .padding(8)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(btnColor.mainColor.opacity(0.5))
                                    .shadow(color: Theme.black.mainColor.opacity(0.25), radius: 2, x: 3, y: 5)
                            )
                            .padding(.vertical, 10)
                    }
                    .padding(.horizontal, 30)
                    Button(action: { isActiveBottomBtn = true; bottomLinkAction() }) {
                        Text(bottomLinkText!)
                            .foregroundColor(btnColor.mainColor.opacity(0.5))
                            .underline()
                            .frame(maxWidth: .infinity)
                    }
                } else {
                    Button(action: { withAnimation { targetIndex.forward(); bottomBtnAction() } }) {
                        Text(bottomBtnText)
                            .foregroundColor(btnColor.accentColor)
                            .frame(maxWidth: .infinity)
                            .padding(8)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(btnColor.mainColor.opacity(0.5))
                                    .shadow(color: Theme.black.mainColor.opacity(0.25), radius: 2, x: 3, y: 5)
                            )
                            .padding(.vertical, 10)
                    }.padding(30)
                }
            }
        }
    }
}

extension BottomButtonView {
    // Checks if button belongs to last preview tab
    func isLast() -> Bool {
        return bottomLinkText != nil
    }
    
    init(targetIndex: Binding<CarouselIndex>, previewContent: PreviewContent) {
        self._targetIndex = targetIndex
        
        btnColor = previewContent.btnColor
        bottomBtnText = previewContent.bottomBtnText
        bottomBtnAction = previewContent.bottomBtnAction
        bottomLinkText = previewContent.bottomLinkText
        bottomLinkAction = previewContent.bottomLinkAction
    }
    
    init(targetIndex: Binding<CarouselIndex>, buttonColor btnColor: Theme, isDisabled: Bool = false, bottomButtonText bottomBtnText: String, bottomButtonAction bottomBtnAction: @escaping () -> Void) {
        self._targetIndex = targetIndex
        
        self.btnColor = btnColor
        self.isDisabled = isDisabled
        self.bottomBtnText = bottomBtnText
        self.bottomBtnAction = bottomBtnAction
        self.bottomLinkText = nil
        self.bottomLinkAction = {}
    }
}

struct PreviewBottomButtonLastView_Previews: PreviewProvider {
    static let previewContent = PreviewContent.sampleData[1]
    
    static var previews: some View {
        BottomButtonView(targetIndex: .constant(CarouselIndex(value: 1, limit: 2)), previewContent: previewContent)
    }
}
