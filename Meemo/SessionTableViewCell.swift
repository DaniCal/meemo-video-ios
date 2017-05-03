//
//  SessionTableViewCell.swift
//  Meemo
//
//  Created by Daniel Lohse on 4/29/17.
//  Copyright © 2017 Superstudio. All rights reserved.
//

import UIKit

class SessionTableViewCell: UITableViewCell {
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var playImage: UIImageView!
    @IBOutlet weak var name: UILabel!


    override func awakeFromNib() {
                super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func isSessionlocked(_ isLocked: Bool){
        if(isLocked){
            lockSession()
        }else{
            unlockSession()
        }
    }

    func unlockSession(){
        playImage.image = UIImage(named: "img_play_plain")
        name.alpha = 1.0
        time.alpha = 1.0
    }
    
    func lockSession(){
        playImage.image = UIImage(named: "img_play_empty")
        name.alpha = 0.5
        time.alpha = 0.5
    }
    
    

}
