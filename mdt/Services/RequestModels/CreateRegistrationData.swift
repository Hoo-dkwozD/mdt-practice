//
//  CreateRegistrationData.swift
//  mdt
//
//  Created by Derrick Hoon on 10/1/23.
//

import Foundation

struct CreateRegistrationData: Codable {
    let username: String
    let password: String
    
    enum CodingKeys: String, CodingKey {
        case username
        case password
    }
}
