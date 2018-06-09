//
//  CommetsTVC.swift
//  Techtest
//
//  Created by Ellan Esenaliev on 08.06.2018.
//  Copyright © 2018 Ellan Esenaliev. All rights reserved.
//

import UIKit

class CommetsTVC: BaseTVC {
    
    var post: Post?
    var comments = [Comment]()
    
    var loadingState: LoadingState = .Loading

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Comments"
        if let post = self.post {
            self.getCommentsFor(post: post)
        }
        self.setupTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    private func setupTableView() {
        self.tableView.allowsSelection = false
        self.tableView.register(CommentTVCell.nib, forCellReuseIdentifier: CommentTVCell.identifier)
    }
    
    private func getCommentsFor(post: Post) {
        NetworkManager.instance.getCommentsForPost(postId: post.id) { (comments, error) in
            self.loadingState = .Loaded
            if error == nil {
                self.comments = comments
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if loadingState == .Loading {
            let loadinIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
            loadinIndicatorView.startAnimating()
            tableView.backgroundView = loadinIndicatorView
        } else {
            tableView.backgroundView = nil
        }
        return self.comments.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CommentTVCell.identifier, for: indexPath) as! CommentTVCell
        cell.setupCommet(comment: self.comments[indexPath.row])
        return cell
    }

}
