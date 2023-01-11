//
//  PreviewSceneView.swift
//  mdt
//
//  Created by Derrick Hoon on 4/1/23.
//

import SwiftUI

struct PreviewView: View {
    @Binding var targetIndex: CarouselIndex
    
    let previewContent: PreviewContent
    
    var body: some View {
        VStack {
            Spacer()
            PreviewMainContentView(previewContent: previewContent)
            Spacer()
            BottomButtonView(targetIndex: $targetIndex, previewContent: previewContent)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 40)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previewContent = PreviewContent.sampleData[1]
    
    static var previews: some View {
        PreviewView(targetIndex: .constant(CarouselIndex(value: 1, limit: 2)), previewContent: previewContent)
    }
}
