//
//  Theme.swift
//  mdt
//
//  Created by Derrick Hoon on 5/1/23.
//

import SwiftUI

enum Theme: String {
    case base
    case black
    case blue
    case cyan
    case darkBlue
    case darkCyan
    case failureRed
    case gray
    case lightBlue
    case successGreen
    case white
    
    var mainColor: Color {
        Color(rawValue)
    }
    var accentColor: Color {
        switch self {
            case .base, .successGreen, .white: return .black
            default: return .white
        }
    }
}
