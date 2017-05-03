//
//  MainCourseViewController.swift
//  Meemo
//
//  Created by Daniel Lohse on 5/3/17.
//  Copyright © 2017 Superstudio. All rights reserved.
//

import UIKit
import MXParallaxHeader

class MainCourseViewController: MXScrollViewController {

    
    var course:MeemoCourse?
    var headerSegueIdentifier = "parallaxHeader"
    var sessionListIdentifier = "sessionList"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //Triggers when segues to ProgramView
        if  segue.identifier == headerSegueIdentifier,
            let destination = segue.destination as? MXFalconViewController
        {
            destination.course = course
            
        }else if segue.identifier == sessionListIdentifier,
            let destination = segue.destination as? TestCourseViewController
        {
            destination.course = course
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
