//
//  ImageCVCell.swift
//  Techtest
//
//  Created by Ellan Esenaliev on 09.06.2018.
//  Copyright © 2018 Ellan Esenaliev. All rights reserved.
//

import UIKit
import SDWebImage

class ImageCVCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    class var identifier: String {
        return String(describing: self)
    }
    
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupImage(image: AlbumImage) {
        self.imageView.sd_setImage(with: URL(string: image.thumbnailUrl), completed: nil)
    }

}
