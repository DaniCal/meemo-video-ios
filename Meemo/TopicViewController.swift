//
//  TopicViewController.swift
//  Meemo
//
//  Created by Daniel Lohse on 5/10/17.
//  Copyright © 2017 Superstudio. All rights reserved.
//

import UIKit
import MXParallaxHeader


class TopicViewController: MXScrollViewController {

    var headerSegueIdentifier = "topicHeader"
    var topicListIdentifier = "topicList"
    var course:MeemoCourse?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 21.0/255, green: 21.0/255, blue: 24.0/255, alpha: 1.0)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //Triggers when segues to ProgramView
        if  segue.identifier == headerSegueIdentifier,
            let destination = segue.destination as? TopicHeaderViewController
        {
            //destination.course = course
            
        }else if segue.identifier == topicListIdentifier,
            let destination = segue.destination as? TopicListViewController
        {
            //destination.course = course
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
