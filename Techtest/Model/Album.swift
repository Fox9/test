//
//  Album.swift
//  Techtest
//
//  Created by Ellan Esenaliev on 09.06.2018.
//  Copyright © 2018 Ellan Esenaliev. All rights reserved.
//

import UIKit
import ObjectMapper

class Album: Mappable  {
    var id: Int = 0
    var userId: Int = 0
    var title: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        self.id <- map["id"]
        self.userId <- map["userId"]
        self.title <- map["title"]
    }
}
