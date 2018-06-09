//
//  Post.swift
//  Techtest
//
//  Created by Ellan Esenaliev on 07.06.2018.
//  Copyright © 2018 Ellan Esenaliev. All rights reserved.
//

import Foundation
import ObjectMapper

class Post: Mappable {
    
    var id: Int = 0
    var userId: Int = 0
    var title: String = ""
    var body: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        self.id <- map["id"]
        self.userId <- map["userId"]
        self.title <- map["title"]
        self.body <- map["body"]
    }
    
    
}
