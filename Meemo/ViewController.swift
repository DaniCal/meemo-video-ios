//
//  ViewController.swift
//  Meemo
//
//  Created by Daniel Lohse on 4/21/17.
//  Copyright © 2017 Superstudio. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController {
    
    let interactor = Interactor()

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "modal"){
            if let destinationViewController = segue.destination as? ModalViewController {
                destinationViewController.transitioningDelegate = self
                destinationViewController.interactor = interactor
            }
        }else if(segue.identifier == "cube"){
            if let destinationViewController = segue.destination as? CubeViewController{
                destinationViewController.transitioningDelegate = self
                destinationViewController.interactor = interactor
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UIViewControllerTransitioningDelegate {
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissAnimator()
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactor.hasStarted ? interactor : nil
    }
    
}
