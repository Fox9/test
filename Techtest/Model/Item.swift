//
//  PostsItem.swift
//  Techtest
//
//  Created by Ellan Esenaliev on 09.06.2018.
//  Copyright © 2018 Ellan Esenaliev. All rights reserved.
//

import Foundation

enum PostItem {
    case Weather
    case Post
}

protocol Item {
    func getItem() -> PostItem
}
