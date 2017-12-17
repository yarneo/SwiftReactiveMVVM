//
//  User.swift
//  ReactiveMVVM
//
//  Created by Yarden Eitan on 9/2/17.
//  Copyright © 2017 Yarden Eitan. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class User: Object, Mappable {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var surname: String = ""
    @objc dynamic var name: String?
    @objc dynamic var email: String?
    @objc dynamic var password: String?
    @objc dynamic var photo: String?
    @objc dynamic var phone: String?
    @objc dynamic var age: String?
    @objc dynamic var credit_card: String?
    @objc dynamic var title: String?
    @objc dynamic var birthday: String?
    @objc dynamic var region: String?
    @objc dynamic var gender: String?

    var details: [(String, String)] {
        return [("email", email ?? ""),
                ("phone", phone ?? ""),
                ("password", password ?? ""),
                ("age", age ?? ""),
                ("credit_card", credit_card ?? ""),
                ("birthday", birthday ?? ""),
                ("region", region ?? ""),
                ("gender", gender ?? "")]
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    func mapping(map: Map) {
        surname         <- map["surname"]
        name            <- map["name"]
        email           <- map["email"]
        password        <- map["password"]
        photo           <- map["photo"]
        phone           <- map["phone"]
        age             <- (map["age"],
                            TransformOf<String, Int>(fromJSON: { String($0!) }, toJSON: { $0.map { Int($0)! } }))
        credit_card     <- map["credit_card.number"]
        title           <- map["title"]
        birthday        <- map["birthday.mdy"]
        region          <- map["region"]
        gender          <- map["gender"]

    }
    

}
