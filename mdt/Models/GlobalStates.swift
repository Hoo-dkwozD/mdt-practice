//
//  GlobalStates.swift
//  mdt
//
//  Created by Derrick Hoon on 10/1/23.
//

import Foundation

class GlobalStates: ObservableObject {
    @Published var APIToken: String? = nil
    @Published var accountNo: String? = nil
    @Published var username: String? = nil
    
    func update(APIToken: String, accountNo: String, username: String) {
        self.APIToken = APIToken
        self.accountNo = accountNo
        self.username = username
    }
    
    func clear() {
        self.APIToken = nil
        self.accountNo = nil
        self.username = nil
    }
}
