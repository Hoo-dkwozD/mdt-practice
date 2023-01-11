//
//  PreviewsView.swift
//  mdt
//
//  Created by Derrick Hoon on 6/1/23.
//

import SwiftUI

struct PreviewsView: View {
    @State var previewContents: [PreviewContent]
    @State var targetIndex: CarouselIndex
    
    
    
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $targetIndex.value) {
                    ForEach((0..<targetIndex.limit), id: \.self) { index in
                        PreviewView(targetIndex: $targetIndex, previewContent: previewContents[index])
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                HStack {
                    ForEach((0..<targetIndex.limit), id: \.self) { index in
                        Circle()
                            .fill(index == targetIndex.value ? Theme.gray.mainColor : Theme.gray.mainColor.opacity(0.5))
                            .frame(width: 8, height: 8)
                            .padding(3)
                    }
                }
            }
        }
        .background(Theme.base.mainColor)
    }
    
    
}

struct PreviewsView_Previews: PreviewProvider {
    static var previewContents: [PreviewContent] = PreviewContent.sampleData
    static var targetIndex: CarouselIndex = CarouselIndex(value: 0, limit: previewContents.count)
    
    static var previews: some View {
        NavigationView {
            PreviewsView(previewContents: previewContents, targetIndex: targetIndex)
        }
    }
}
