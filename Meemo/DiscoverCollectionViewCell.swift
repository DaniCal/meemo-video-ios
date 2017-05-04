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
    
    let interactor = Interactor()

    
    var course:MeemoCourse?{
        didSet{
            self.updateUI()
            
        }
    }
    
    private func updateUI(){
        if let course = course {
            courseImage.image = UIImage(named: course.courseImageFileSquare!)
            courseTitle.text = course.name
            authorName.text = course.author
        }else{
            courseImage.image = nil
            courseTitle.text = nil
            authorName = nil
        }
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        courseImage.clipsToBounds = true
        courseImage.layer.cornerRadius = 2.0
        
        //self.clipsToBounds = true
    }
}
