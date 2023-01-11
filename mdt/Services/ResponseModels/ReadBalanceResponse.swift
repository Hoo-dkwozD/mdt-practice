//
//  ReadBalanceResponse.swift
//  mdt
//
//  Created by Derrick Hoon on 10/1/23.
//

import Foundation

struct ReadBalanceResponse: Codable {
    let status: String
    let accountNo: String?
    let balance: Int?
    let error: String?
    
    enum CodingKeys: String, CodingKey {
        case status
        case accountNo
        case balance
        case error
    }
}

extension ReadBalanceResponse {
    func isSuccessful() -> Bool {
        if (status == "success") {
            guard (accountNo != nil) else { return false }
            guard (balance != nil) else { return false }
            
            return true
        } else {
            return false
        }
    }
}
