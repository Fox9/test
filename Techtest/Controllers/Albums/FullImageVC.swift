//
//  FullImageVC.swift
//  Techtest
//
//  Created by Ellan Esenaliev on 09.06.2018.
//  Copyright © 2018 Ellan Esenaliev. All rights reserved.
//

import UIKit

class FullImageVC: UIViewController {
    
    var image: AlbumImage?

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Image"
        if let image = self.image {
            self.titleLabel.text = image.title
            self.imageView.sd_setImage(with: URL(string: image.url), completed: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
