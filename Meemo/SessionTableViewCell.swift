//
//  SessionTableViewCell.swift
//  Meemo
//
//  Created by Daniel Lohse on 4/29/17.
//  Copyright © 2017 Superstudio. All rights reserved.
//

import UIKit

class SessionTableViewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var playImage: UIImageView!
    @IBOutlet weak var time: UILabel!

    override func awakeFromNib() {
                super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func lockSession(){
//        playImage = Ima
    }
    

}
