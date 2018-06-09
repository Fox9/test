//
//  NetworkManager.swift
//  Techtest
//
//  Created by Ellan Esenaliev on 07.06.2018.
//  Copyright © 2018 Ellan Esenaliev. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class NetworkManager: NSObject {
    
    static let instance = NetworkManager()
    
    private let baseURL = "http://jsonplaceholder.typicode.com"
    
    //MARK:: POSTS AND COMMENTS
    
    func getPosts(complition: @escaping ([Post], Error?) -> ()) {
        let url = baseURL + "/posts"
        Alamofire.request(url).responseJSON { response in
            if let json = response.result.value as? [[String: Any]] {
                let posts = Mapper<Post>().mapArray(JSONArray: json)
                complition(posts, nil)
            } else {
                complition([], response.error)
            }
        }
    }
    
    func getCommentsForPost(postId id: Int, complition: @escaping ([Comment], Error?) -> ()) {
        let url = baseURL + "/posts/\(id)/comments"
        Alamofire.request(url).responseJSON { response in
            if let json = response.result.value as? [[String: Any]] {
                let comments = Mapper<Comment>().mapArray(JSONArray: json)
                complition(comments, nil)
            } else {
                complition([], response.error)
            }
        }
    }
    
    
    //MARK: ALBUMS
    
    func getAlbums(complition: @escaping([Album], Error?) -> ()) {
        let url = baseURL + "/albums"
        Alamofire.request(url).responseJSON { response in
            if let json = response.result.value as? [[String: Any]] {
                let albums = Mapper<Album>().mapArray(JSONArray: json)
                complition(albums, nil)
            } else {
                complition([], response.error)
            }
        }
    }
}
