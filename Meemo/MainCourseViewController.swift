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
        initNavigationBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
       
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //Triggers when segues to ProgramView
        if  segue.identifier == headerSegueIdentifier,
            let destination = segue.destination as? HeaderViewController
        {
            destination.course = course
            
        }else if segue.identifier == sessionListIdentifier,
            let destination = segue.destination as? TestCourseViewController
        {
            destination.course = course
        }
    }

    func initNavigationBar(){
        //Make the navigation bar appear
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        //replace the back button image item
        var backBtn = UIImage(named: "nav_back_icon")
        backBtn = backBtn?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        self.navigationController?.navigationBar.backIndicatorImage =  backBtn
        self.navigationController!.navigationBar.backIndicatorTransitionMaskImage = backBtn;
        
        //replace the back button title
        self.navigationController?.navigationBar.backItem?.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        
        //Make the navigation bar transparaent
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
//        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
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
