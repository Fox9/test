//
//  AlbumImage.swift
//  Techtest
//
//  Created by Ellan Esenaliev on 09.06.2018.
//  Copyright © 2018 Ellan Esenaliev. All rights reserved.
//

import Foundation
import ObjectMapper

class AlbumImage: Mappable  {
    var id: Int = 0
    var albumId: Int = 0
    var title: String = ""
    var url: String = ""
    var thumbnailUrl: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        self.id <- map["id"]
        self.albumId <- map["albumId"]
        self.title <- map["title"]
        self.url <- map["url"]
        self.thumbnailUrl <- map["thumbnailUrl"]
    }
}
