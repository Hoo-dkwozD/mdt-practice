//
//  CarouselIndex.swift
//  mdt
//
//  Created by Derrick Hoon on 6/1/23.
//

import Foundation

struct CarouselIndex {
    var value: Int = 0
    var limit: Int = 1
    
    mutating func forward() {
        if value >= (limit - 1) {
            value = max(limit - 1, 0)
        } else {
            value += 1
        }
    }
}
