//
//  PreviewMainContentView.swift
//  mdt
//
//  Created by Derrick Hoon on 6/1/23.
//

import SwiftUI

struct PreviewMainContentView: View {
    let title: String
    let desc: String
    let imgName: String
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(title)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom)
                    Spacer()
                }
                HStack {
                    Text(desc)
                        .foregroundColor(Theme.black.mainColor.opacity(0.75))
                        .padding(.bottom)
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity)
            Image(imgName)
                .padding(.vertical)
        }
    }
}

extension PreviewMainContentView {
    init(previewContent: PreviewContent) {
        title = previewContent.title
        desc = previewContent.desc
        imgName = previewContent.imgName
    }
}

struct PreviewMainContentView_Previews: PreviewProvider {
    static let previewContent = PreviewContent.sampleData[1]
    
    static var previews: some View {
        PreviewMainContentView(previewContent: previewContent)
    }
}
