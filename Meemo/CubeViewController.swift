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

class CubeViewController: UIViewController, OHCubeViewDelegate{
    
    @IBOutlet weak var cubeView: OHCubeView!
    
    
    func cubeViewDidFinishScroll(toIndex: Int){
        print("here")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cubeView.cubeDelegate = self
        
        
//      let vid1 = ModalViewController()
        
        let iv1 = UIImageView(image: UIImage(named: "img1"))
        let iv2 = UIImageView(image: UIImage(named: "img2"))
        let iv3 = UIImageView(image: UIImage(named: "img3"))
        
        
        cubeView.addChildViews([iv1, iv2, iv3])
        
        cubeView.scrollToViewAtIndex(2, animated: true)
        
        
    }

}
