//
//  DiscoverCollectionViewCell.swift
//  Meemo
//
//  Created by Daniel Lohse on 5/4/17.
//  Copyright © 2017 Superstudio. All rights reserved.
//

import UIKit

class DiscoverCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var courseImage: UIImageView!
    @IBOutlet weak var courseTitle: UILabel!
    
    @IBOutlet weak var authorName: UILabel!
    //min 20
    
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        courseImage.layer.cornerRadius = 3.0
        
        //self.clipsToBounds = true
    }
}
