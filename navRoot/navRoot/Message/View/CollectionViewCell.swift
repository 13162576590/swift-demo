//
//  CollectionViewCell.swift
//  navRoot
//
//  Created by CarterChen on 16/4/10.
//  Copyright © 2016年 CarterChen. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var titleLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.backgroundColor = UIColor.purple
    }

}
