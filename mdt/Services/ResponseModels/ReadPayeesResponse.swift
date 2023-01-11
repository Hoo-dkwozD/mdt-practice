//
//  ReadPayeesResponse.swift
//  mdt
//
//  Created by Derrick Hoon on 10/1/23.
//

import Foundation

struct ReadPayeesResponse: Codable {
    let status: String
    let data: [Payee]?
    let error: String?
    
    enum CodingKeys: String, CodingKey {
        case status
        case data
        case error
    }
}

extension ReadPayeesResponse {
    func isSuccessful() -> Bool {
        if (status == "success") {
            guard (data != nil) else { return false }
            
            return true
        } else {
            return false
        }
    }
}

struct Payee: Codable {
    let id: String
    let name: String
    let accountNo: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case accountNo
    }
}
