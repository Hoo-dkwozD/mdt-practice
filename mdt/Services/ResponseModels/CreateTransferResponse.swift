//
//  CreateTransferResponse.swift
//  mdt
//
//  Created by Derrick Hoon on 11/1/23.
//

import Foundation

struct CreateTransferResponse: Codable {
    let status: String
    let transactionId: String?
    let amount: Double?
    let description: String?
    let recipientAccount: String?
    let error: String?
    
    enum CodingKeys: String, CodingKey {
        case status
        case transactionId
        case amount
        case description
        case recipientAccount
        case error
    }
}

extension CreateTransferResponse {
    func isSuccessful() -> Bool {
        if (status == "success") {
            guard (transactionId != nil) else { return false}
            guard (amount != nil) else { return false }
            
        }
    }
}
