//
//  BadgeViewController.swift
//  Meemo
//
//  Created by Daniel Lohse on 4/30/17.
//  Copyright © 2017 Superstudio. All rights reserved.
//

import UIKit

class BadgeViewController: UIViewController{
    
   
    @IBOutlet weak var popup: UIView!
    
    @IBAction func dismissPopup(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)

    }
    
    @IBAction func watchNext(_ sender: AnyObject) {
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popup.layer.cornerRadius = 10
        popup.layer.masksToBounds = true
    }
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}
