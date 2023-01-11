//
//  ViewUsageError.swift
//  mdt
//
//  Created by Derrick Hoon on 11/1/23.
//

import Foundation

enum ViewUsageError: Error {
    case missingBackgroundColor
}

extension ViewUsageError: LocalizedError {
    var errorDescription: String? {
        switch self {
            case .missingBackgroundColor:
                return NSLocalizedString("At least one background color is required", comment: "")
        }
    }
}
