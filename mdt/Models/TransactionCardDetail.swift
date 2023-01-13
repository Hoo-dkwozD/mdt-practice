//
//  TransactionCardDetails.swift
//  mdt
//
//  Created by Derrick Hoon on 12/1/23.
//

import Foundation

struct TransactionCardDetail {
    let date: Date
    let transactionDetails: [TransactionDetail]
}

extension TransactionCardDetail {
    static func getDateFromString(dateString: String, dateFormat: String = "dd/MM/yy") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        
        return dateFormatter.date(from: dateString)
    }
    
    static var sampleData: [Self] {
        return [
            Self(date: getDateFromString(dateString: "01/02/2022") ?? Date(), transactionDetails: [
                TransactionDetail(transactionId: "1", username: "test1", accountNo: "abc", amount: 20.0, transactionDate: getDateFromString(dateString: "01/02/2022T10:10:10", dateFormat: "dd/MM/yyyy'T'HH:mm:ss") ?? Date(), description: "Test", transactionType: "transfer"),
                TransactionDetail(transactionId: "2", username: "test2", accountNo: "def", amount: -40.0, transactionDate: getDateFromString(dateString: "01/02/2022T12:10:10", dateFormat: "dd/MM/yyyy'T'HH:mm:ss") ?? Date(), description: "Test", transactionType: "transfer")
            ]),
            Self(date: getDateFromString(dateString: "02/02/2022") ?? Date(), transactionDetails: [
                TransactionDetail(transactionId: "1", username: "test1", accountNo: "abc", amount: -20.0, transactionDate: getDateFromString(dateString: "01/02/2022T12:10:10", dateFormat: "dd/MM/yyyy'T'HH:mm:ss") ?? Date(), description: "Test", transactionType: "transfer"),
                TransactionDetail(transactionId: "2", username: "test2", accountNo: "def", amount: 40.0, transactionDate: getDateFromString(dateString: "01/02/2022T10:10:10", dateFormat: "dd/MM/yyyy'T'HH:mm:ss") ?? Date(), description: "Test", transactionType: "transfer")
            ])
        ]
    }
}

struct TransactionDetail {
    let transactionId: String
    let username: String
    let accountNo: String
    let amount: Double
    let transactionDate: Date
    let description: String
    let transactionType: String
}

extension Date {
    func getDateDescription() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, dd MMM yyyy"
        
        return dateFormatter.string(from: self)
    }
    
    func getDatetimeDescription() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, dd MMM yyyy, h:mm a"
        
        return dateFormatter.string(from: self)
    }
    
    func getDateOnly() -> Date? {
        let x: Set<Calendar.Component> = [.year, .month, .day, .hour, .minute, .second]
        let cal = Calendar.current
        var components = cal.dateComponents(x, from: self)

        components.hour = 0
        components.minute = 0
        components.second = 1

        return cal.date(from: components)
    }
}
