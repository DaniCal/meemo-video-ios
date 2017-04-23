//
//  ModalViewController.swift
//  Meemo
//
//  Created by Daniel Lohse on 4/22/17.
//  Copyright © 2017 Superstudio. All rights reserved.
//
import UIKit
import AVFoundation

class ModalViewController: UIViewController {
    
    public var player:AVPlayer?
    var interactor:Interactor? = nil
    
    @IBAction func handleGesture(_ sender: UIPanGestureRecognizer) {
        
        let percentThreshold:CGFloat = 0.3
        
        // convert y-position to downward pull progress (percentage)
        let translation = sender.translation(in: view)
        let verticalMovement = translation.y / view.bounds.height
        let downwardMovement = fmaxf(Float(verticalMovement), 0.0)
        let downwardMovementPercent = fminf(downwardMovement, 1.0)
        let progress = CGFloat(downwardMovementPercent)
        
        guard let interactor = interactor else { return }
        
        switch sender.state {
        case .began:
            player?.pause()
            interactor.hasStarted = true
            dismiss(animated: true, completion: nil)
        case .changed:
            interactor.shouldFinish = progress > percentThreshold
            interactor.update(progress)
        case .cancelled:
            interactor.hasStarted = false
            interactor.cancel()
        case .ended:
            interactor.hasStarted = false
            if(interactor.shouldFinish){
                interactor.finish()
            }else{
                interactor.cancel()
                player?.play()
            }
        default: break
        
        }
        
        
    }
    @IBAction func close(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
