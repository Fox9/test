//
//  PostsTVC.swift
//  Techtest
//
//  Created by Ellan Esenaliev on 07.06.2018.
//  Copyright © 2018 Ellan Esenaliev. All rights reserved.
//

import UIKit
import SafariServices

class PostsTVC: BaseTVC {
    
    var postsItems = [Item]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registrXib()
        self.getPosts()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func registrXib() {
        self.tableView.register(PostTVCell.nib, forCellReuseIdentifier: PostTVCell.identifier)
        self.tableView.register(WeatherTVCell.nib, forCellReuseIdentifier: WeatherTVCell.identifier)
    }
    
    private func getPosts() {
        NetworkManager.instance.getPosts { (posts, error) in
            if error == nil {
                self.postsItems = posts
                self.getWeather()
            }
        }
    }
    
    private func getWeather() {
        var count = 0
        
        func checkForCount() {
            if count == 4 {
                self.postsItems.shuffle()
                self.tableView.reloadData()
            }
        }
        
        NetworkManager.instance.getWeatherForCity(city: City.Bishkek, cityName: "Bishkek") { (weather, error) in
            if let weather = weather {
                self.postsItems.append(weather)
                count += 1
                checkForCount()
            }
        }
        
        NetworkManager.instance.getWeatherForCity(city: City.CholponAta, cityName: "CholponAta") { (weather, error) in
            if let weather = weather {
                self.postsItems.append(weather)
                count += 1
                checkForCount()
            }
        }
        
        NetworkManager.instance.getWeatherForCity(city: City.Naryn, cityName: "Naryn") { (weather, error) in
            if let weather = weather {
                self.postsItems.append(weather)
                count += 1
                checkForCount()
            }
        }
        
        NetworkManager.instance.getWeatherForCity(city: City.Ow, cityName: "Ow") { (weather, error) in
            if let weather = weather {
                self.postsItems.append(weather)
                count += 1
                checkForCount()
            }
        }
    }
}

// MARK: - Table view data source

extension PostsTVC {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.postsItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = postsItems[indexPath.row]
        if item.getItem() == PostItem.Post  {
            let cell = tableView.dequeueReusableCell(withIdentifier: PostTVCell.identifier, for: indexPath) as! PostTVCell
            cell.setupPost(post: item as! Post)
            return cell
        }
        
        if item.getItem() == PostItem.Weather  {
            let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTVCell.identifier, for: indexPath) as! WeatherTVCell
            cell.setupWeather(weather: item as! Weather)
            return cell
        }
        
        return UITableViewCell()
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        let item = postsItems[indexPath.row]
        if item.getItem() == PostItem.Post  {
            let vc = UIStoryboard(name: Constants.POSTS_STORYBOARD, bundle: nil).instantiateViewController(withIdentifier: "CommetsTVC") as! CommetsTVC
            vc.post = item as? Post
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            let svc = SFSafariViewController(url: URL(string: "https://o.kg")!)
            present(svc, animated: true, completion: nil)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
}
