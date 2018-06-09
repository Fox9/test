//
//  Weather.swift
//  Techtest
//
//  Created by Ellan Esenaliev on 09.06.2018.
//  Copyright © 2018 Ellan Esenaliev. All rights reserved.
//

import UIKit
import ObjectMapper

enum City: String {
    case Bishkek = "42.875239,74.595248"
    case CholponAta = "42.651060,77.081322"
    case Naryn = "41.427716,75.998139"
    case Ow = "40.515210,72.804373"
}

class Weather: Mappable, Item  {
    
    var city: String = ""
    var summary: String = ""
    var temperature: Double = 0.0
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        self.summary <- map["summary"]
        self.temperature <- map["temperature"]
    }
    
    func getItem() -> PostItem {
        return PostItem.Weather
    }
    
}
