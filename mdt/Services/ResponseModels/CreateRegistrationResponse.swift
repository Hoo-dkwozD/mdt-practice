//
//  CreateRegistrationResponse.swift
//  mdt
//
//  Created by Derrick Hoon on 10/1/23.
//

import Foundation

struct CreateRegistrationResponse: Codable {
    let status: String
    let token: String?
    let error: String?
    
    enum CodingKeys: String, CodingKey {
        case status
        case token
        case error
    }
}

extension CreateRegistrationResponse {
    func isSuccessful() -> Bool {
        if (status == "success") {
            guard (token != nil) else { return false }
            
            return true
        } else {
            return false
        }
    }
}
