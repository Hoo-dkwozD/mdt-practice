//
//  mdtApp.swift
//  mdt
//
//  Created by Derrick Hoon on 4/1/23.
//

import SwiftUI

@main
struct mdtApp: App {
    @StateObject var globalStates = GlobalStates()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                PreviewsView(previewContents: PreviewContentData.mainData, targetIndex: CarouselIndex(value: 0, limit: PreviewContentData.mainData.count))
            }
            .environmentObject(globalStates)
        }
    }
}
