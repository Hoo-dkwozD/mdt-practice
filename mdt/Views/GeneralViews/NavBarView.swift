//
//  NavBarView.swift
//  mdt
//
//  Created by Derrick Hoon on 13/1/23.
//

import SwiftUI

/// The nav bar to be used in the Home Scene
struct NavBarView: View {
    /// Collection of details per button to be included in the bottom nav bar
    let navBarButtonDetails: [NavBarButtonDetail]
    
    /// Main view content
    var body: some View {
        HStack {
            /// Iterate through all button details provided
            ForEach(navBarButtonDetails) { navBarButtonDetail in
                NavBarButtonView(buttonAction: navBarButtonDetail.btnAction, buttonIconName: navBarButtonDetail.btnIcon, btnBackgroundColor: navBarButtonDetail.btnColor)
            }
        }
        .background(Theme.base.mainColor)
        .cornerRadius(15, corners: .topLeft)
        .cornerRadius(15, corners: .topRight)
        .shadow(color: Theme.black.mainColor.opacity(0.25), radius: 2, x: 3, y: -5)
    }
}

/// Allows for creation of rectangular views with custom control over the rounding radius of each corner
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(
            RoundedCorner(radius: radius, corners: corners)
        )
    }
}

/// Draws the rounded corner based on the radius and corner provided
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

/// Preview the view
struct NavBarView_Previews: PreviewProvider {
    static let navBarButtonDetails = [
        NavBarButtonDetail(btnAction: {}, btnIcon: "Payees", btnColor: [Theme.base]),
        NavBarButtonDetail(btnAction: {}, btnIcon: "Transfer", btnColor: [Theme.lightBlue, Theme.blue])
    ]
    
    static var previews: some View {
        NavBarView(navBarButtonDetails: navBarButtonDetails)
    }
}
