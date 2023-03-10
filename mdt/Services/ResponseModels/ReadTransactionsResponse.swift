//
//  ReadTransactionsResponse.swift
//  mdt
//
//  Created by Derrick Hoon on 10/1/23.
//

import Foundation

struct ReadTransactionsResponse: Codable {
    let status: String
    let data: [Transaction]?
    let error: String?
    
    enum CodingKeys: String, CodingKey {
        case status
        case data
        case error
    }
}

extension ReadTransactionsResponse {
    func isSuccessful() -> Bool {
        if (status == "success") {
            guard (data != nil) else { return false }
            
            return true
        } else {
            return false
        }
    }
}

struct Transaction: Codable {
    let transactionId: String
    let amount: Double
    let transactionDate: String
    let description: String
    let transactionType: String
    let receipient: Account?
    let sender: Account?
    
    enum CodingKeys: String, CodingKey {
        case transactionId
        case amount
        case transactionDate
        case description
        case transactionType
        case receipient
        case sender
    }
}

extension Transaction: Equatable {
    static func ==(left: Transaction, right: Transaction) -> Bool {
        return (left.transactionId == right.transactionId)
    }
}

struct Account: Codable {
    let accountNo: String
    let accountHolder: String
    
    enum CodingKeys: String, CodingKey {
        case accountNo
        case accountHolder
    }
}
