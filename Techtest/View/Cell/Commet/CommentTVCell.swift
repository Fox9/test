//
//  CommetTVCell.swift
//  Techtest
//
//  Created by Ellan Esenaliev on 08.06.2018.
//  Copyright © 2018 Ellan Esenaliev. All rights reserved.
//

import UIKit

class CommentTVCell: UITableViewCell {
    
    class var identifier: String {
        return String(describing: self)
    }
    
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    @IBOutlet weak var commetBodyLabel: UILabel!
    @IBOutlet weak var commetNameLabel: UILabel!
    @IBOutlet weak var commetEmailLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCommet(comment: Comment) {
        self.commetBodyLabel.text = comment.body
        self.commetNameLabel.text = comment.name
        self.commetEmailLabel.text = comment.email
    }
    
}
