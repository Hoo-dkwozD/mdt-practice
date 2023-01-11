//
//  ResponseState.swift
//  mdt
//
//  Created by Derrick Hoon on 11/1/23.
//

import Foundation

struct ResponseState<Response: Codable> {
    var isSuccess: Bool
    var data: Response? = nil
    var error: String? = nil
    
    init(_ isSuccess: Bool, data: Response?, error: String?) {
        self.isSuccess = isSuccess
        self.data = data
        self.error = error
    }
}
