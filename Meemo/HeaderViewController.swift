//
//  HeaderViewController.swift
//  Meemo
//
//  Created by Daniel Lohse on 5/3/17.
//  Copyright © 2017 Superstudio. All rights reserved.
//

import UIKit
//import MXParallaxHeader


class HeaderViewController: UIViewController {

    var course:MeemoCourse?

    @IBOutlet weak var authorImage: UIImageView!
    @IBOutlet weak var authorName: UILabel!
    
    @IBOutlet weak var courseTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        authorName.text = course?.author
        authorImage.image = UIImage(named:(course?.courseImageFileBig)!)
        courseTitle.text = course?.name

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func parallaxHeaderDidScroll(_ parallaxHeader: MXParallaxHeader) {
//        //        let angle = parallaxHeader.progress * CGFloat(M_PI) * 2
//        //        self.falcon.transform = CGAffineTransform.identity.rotated(by: angle)
//    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
