//
//  ModalViewController.swift
//  Meemo
//
//  Created by Daniel Lohse on 4/22/17.
//  Copyright © 2017 Superstudio. All rights reserved.
//
import UIKit

class ModalViewController: UIViewController {
    
    @IBAction func close(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
}
