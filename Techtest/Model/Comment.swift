//
//  Comment.swift
//  Techtest
//
//  Created by Ellan Esenaliev on 08.06.2018.
//  Copyright © 2018 Ellan Esenaliev. All rights reserved.
//

import UIKit
import ObjectMapper

class Comment: Mappable  {
    var id: Int = 0
    var postId: Int = 0
    var name: String = ""
    var email: String = ""
    var body: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        self.id <- map["id"]
        self.postId <- map["postId"]
        self.name <- map["name"]
        self.email <- map["email"]
        self.body <- map["body"]
    }
    

}
