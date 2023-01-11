//
//  PreviewContent.swift
//  mdt
//
//  Created by Derrick Hoon on 6/1/23.
//

import Foundation
import SwiftUI

struct PreviewContent: Identifiable {
    let id: UUID
    var title: String
    var desc: String
    var imgName: String
    var btnColor: Theme
    var bottomBtnText: String
    var bottomBtnAction: () -> Void
    var bottomLinkText: String?
    var bottomLinkAction: () -> Void
    
    init(id: UUID = UUID(), title: String, description desc: String, imageName imgName: String, buttonColor btnColor: Theme, bottomButtonText bottomBtnText: String, bottomButtonAction bottomBtnAction: @escaping () -> Void, bottomLinkText: String? = nil, bottomLinkAction: @escaping () -> Void = {}) {
        self.id = id
        self.title = title
        self.desc = desc
        self.imgName = imgName
        self.btnColor = btnColor
        self.bottomBtnText = bottomBtnText
        self.bottomBtnAction = bottomBtnAction
        self.bottomLinkText = bottomLinkText
        self.bottomLinkAction = bottomLinkAction
    }
}

extension PreviewContent {
    static var sampleData: [PreviewContent] {
        [
            PreviewContent(title: "Test 1", description: "Lorem Ipsum", imageName: "IntuitiveImage", buttonColor: Theme.gray, bottomButtonText: "Next", bottomButtonAction: {}),
            PreviewContent(title: "Test 2", description: "Lorem Ipsum", imageName: "FastImage", buttonColor: Theme.gray, bottomButtonText: "Next", bottomButtonAction: {}, bottomLinkText: "ABC"),
        ]
    }
}
