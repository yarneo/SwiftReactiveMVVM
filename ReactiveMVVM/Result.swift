//
//  Result.swift
//  ReactiveMVVM
//
//  Created by Yarden Eitan on 9/2/17.
//  Copyright © 2017 Yarden Eitan. All rights reserved.
//

import Foundation
import ObjectMapper

struct Result: Mappable {
    var users: [User]?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        users <- map["members"]
    }

}
