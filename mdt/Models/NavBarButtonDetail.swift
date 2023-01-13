//
//  NavBarButtonDetail.swift
//  mdt
//
//  Created by Derrick Hoon on 13/1/23.
//

import Foundation

/// Struct of details of a single button in the bottom nav bar
struct NavBarButtonDetail: Identifiable {
    /// To make NavBarButtonDetails Identifiable for ForEach()
    let id: UUID
    
    /// The closure called when the button is pressed
    let btnAction: () -> Void
    /// The String name of the image icon to be displayed in the button
    let btnIcon: String
    /// An array of Theme colors to be used in the background color of the button
    let btnColor: [Theme]
    
    /**
     Initialises a new set of details about a button to be used in the nav bar.
     
     - Parameters:
        - btnAction: The closure to trigger upon pressing the button.
        - btnIcon: The String name of the image icon to diplay in the button.
        - btnColor: The bacground color scheme of the button.
     
     - Returns: A new set of details about a nav bar button.
     */
    init(btnAction: @escaping () -> Void, btnIcon: String, btnColor: [Theme]) {
        self.id = UUID()
        
        self.btnAction = btnAction
        self.btnIcon = btnIcon
        self.btnColor = btnColor
    }
}
