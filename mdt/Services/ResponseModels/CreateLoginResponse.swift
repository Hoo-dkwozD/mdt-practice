//
//  CreateLoginResponse.swift
//  mdt
//
//  Created by Derrick Hoon on 10/1/23.
//

import Foundation

struct CreateLoginResponse: Codable {
    let status: String
    let token: String?
    let username: String?
    let accountNo: String?
    let error: String?
    
    enum CodingKeys: String, CodingKey {
        case status
        case token
        case username
        case accountNo
        case error
    }
}

extension CreateLoginResponse {
    func isSuccessful() -> Bool {
        if (status == "success") {
            guard (token != nil) else { return false }
            guard (username != nil) else { return false }
            guard (accountNo != nil) else { return false }
            
            return true
        } else {
            return false
        }
    }
}
