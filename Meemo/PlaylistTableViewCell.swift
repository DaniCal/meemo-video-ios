//
//  PlaylistTableViewCell.swift
//  Meemo
//
//  Created by Daniel Lohse on 4/27/17.
//  Copyright © 2017 Superstudio. All rights reserved.
//

import UIKit

class PlaylistTableViewCell: UITableViewCell {
    
//    @IBOutlet weak var titleLabel: UILabel!
//    @IBOutlet weak var descriptionLabel: UILabel!
//    @IBOutlet weak var picture: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//    }
    
    func setTitle(_ title: String){
//        titleLabel.text = title
    }
    
    func setSubtitle(_ subtitle: String){
//        descriptionLabel.text = subtitle
    }
    
    func setImageData(data: Data){
//        picture.image = UIImage(data: data)
    }
    
}
