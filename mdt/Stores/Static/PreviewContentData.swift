//
//  PreviewContentData.swift
//  mdt
//
//  Created by Derrick Hoon on 6/1/23.
//

import Foundation

struct PreviewContentData {
    static var mainData: [PreviewContent] {
        [
            PreviewContent(title: "Intuitive", description: "Simple and intuitive interface for easy-to-use e-wallet", imageName: "IntuitiveImage", buttonColor: Theme.gray, bottomButtonText: "Next", bottomButtonAction: {}),
            PreviewContent(title: "Fast", description: "Fast transfers between e-wallets of different users", imageName: "FastImage", buttonColor: Theme.gray, bottomButtonText: "Next", bottomButtonAction: {}),
            PreviewContent(title: "Convenient", description: "Accessible and simple-to-use e-wallet", imageName: "ConvenientImage", buttonColor: Theme.gray, bottomButtonText: "Login", bottomButtonAction: {}, bottomLinkText: "Don't have an account? Register now"),
        ]
    }
}
