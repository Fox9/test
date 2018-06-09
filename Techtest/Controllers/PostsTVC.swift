//
//  PostsTVC.swift
//  Techtest
//
//  Created by Ellan Esenaliev on 07.06.2018.
//  Copyright © 2018 Ellan Esenaliev. All rights reserved.
//

import UIKit

class PostsTVC: BaseTVC {
    
    var posts = [Post]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.getPosts()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func getPosts() {
        NetworkManager.instance.getPosts { (posts, error) in
            if error == nil {
                self.posts = posts
                self.tableView.reloadData()
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
        return self.posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath)
        let post = self.posts[indexPath.row]
        cell.textLabel?.text = post.title
        cell.detailTextLabel?.text = post.body
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        let vc = UIStoryboard(name: Constants.MAIN_STORYBOARD, bundle: nil).instantiateViewController(withIdentifier: "CommetsTVC") as! CommetsTVC
        vc.post = self.posts[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
}
