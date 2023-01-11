//
//  LoginDetails.swift
//  mdt
//
//  Created by Derrick Hoon on 9/1/23.
//

import Foundation

struct LoginDetails {
    var username = ""
    var password = ""
    
    func isFilled() -> Bool {
        return !(username.isEmpty || password.isEmpty)
    }
}
