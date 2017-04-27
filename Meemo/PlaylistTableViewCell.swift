//
//  PlaylistTableViewCell.swift
//  Meemo
//
//  Created by Daniel Lohse on 4/27/17.
//  Copyright © 2017 Superstudio. All rights reserved.
//

import UIKit

class PlaylistTableViewCell: UITableViewCell {
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    
//    @IBOutlet weak var titleLabel: UILabel!
//    @IBOutlet weak var descriptionLabel: UILabel!
//    @IBOutlet weak var picture: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//    }
    
    func setProgramTitle(_ title: String){
        self.title.text = title
    }
    
    func setProgramAuthor(_ author: String){
        self.author.text = author
    }
    
    func setProgramDuration(_ duration: String){
        self.time.text = duration
    }
    
    func setImageData(_ fileName: String){
        backgroundImage.image = UIImage(named: fileName)
    }
    
}
