//
//  CubeViewController.swift
//  Meemo
//
//  Created by Daniel Lohse on 4/24/17.
//  Copyright © 2017 Superstudio. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
import OHCubeView


class CubeViewController: UIViewController {
    
    @IBOutlet weak var cubeView: OHCubeView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1. Create subviews for our cube view (in this case, five image views)
        
//        let vid1 = ModalViewController()
        
        
        
        
//        let iv1 = UIImageView(image: UIImage(named: "img1"))
        let iv2 = UIImageView(image: UIImage(named: "img2"))
        let iv3 = UIImageView(image: UIImage(named: "img3"))
        
        // 2. Add all subviews to the cube view
        
        cubeView.addChildViews([iv2, iv3])
        
        
    }

}
