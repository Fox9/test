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
            if var json = response.result.value as? [[String: Any]] {
                json.shuffle()
                json = Array(json[0..<10])
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
    
    // MARK: WEATHER
    
    func getWeatherForCity(city: City, cityName: String, complition: @escaping (Weather?, Error?) -> ()) {
        let url = "https://api.darksky.net/forecast/5707701f82068ed621c6ef2b8767b317/\(city.rawValue)"
        Alamofire.request(url).responseJSON { response in
            if let json = response.result.value as? [String: Any], let weatherJSON = json["currently"] as? [String: Any] {
                if let weather = Mapper<Weather>().map(JSON: weatherJSON) {
                    weather.city = cityName
                    complition(weather, nil)
                } else {
                    complition(nil, nil)
                }
            } else {
                complition(nil, response.error)
            }
        }
    }
    
    
    //MARK: ALBUMS
    
    func getAlbums(complition: @escaping([Album], Error?) -> ()) {
        let url = baseURL + "/albums"
        Alamofire.request(url).responseJSON { response in
            if var json = response.result.value as? [[String: Any]] {
                json.shuffle()
                json = Array(json[0..<10])
                let albums = Mapper<Album>().mapArray(JSONArray: json)
                complition(albums, nil)
            } else {
                complition([], response.error)
            }
        }
    }
    
    func getImagesForAlbum(albumId id: Int, complition: @escaping ([AlbumImage], Error?) -> ()) {
        let url = baseURL + "/albums/\(id)/photos"
        Alamofire.request(url).responseJSON { response in
            if let json = response.result.value as? [[String: Any]] {
                let images = Mapper<AlbumImage>().mapArray(JSONArray: json)
                complition(images, nil)
            } else {
                complition([], response.error)
            }
        }
    }
}
