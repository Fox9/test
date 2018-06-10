//
//  AlbumCVCell.swift
//  Techtest
//
//  Created by Ellan Esenaliev on 09.06.2018.
//  Copyright © 2018 Ellan Esenaliev. All rights reserved.
//

import UIKit

class AlbumCVCell: UICollectionViewCell {
    
    class var identifier: String {
        return String(describing: self)
    }
    
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    @IBOutlet weak var albumTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupAlbum(album: Album) {
        self.albumTitleLabel.text = album.title
    }

}
