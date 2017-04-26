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

class CubeViewController: UIViewController, OHCubeViewDelegate, UIGestureRecognizerDelegate{
    @IBOutlet var gestureRecognizer: UIPanGestureRecognizer!
   
    var startLocation:CGPoint?
    var translation:CGPoint?
    
    let vid1 = ModalViewController()
    let vid2 = ModalViewController()
    let vid3 = ModalViewController()
    let vid4 = ModalViewController()
    
    @IBOutlet weak var cubeView: OHCubeView!
    var interactor:Interactor? = nil

    
    func cubeViewDidFinishScroll(toIndex: Int){
        print("I'm on page \(toIndex)")


        switch toIndex {
        case 0:
            vid1.playVideo()
        case 1:
            vid2.playVideo()
        case 2:
            vid3.playVideo()
        case 3:
            vid1.playVideo()
        default:
            break
        }
    }
    
    func configGesture(){
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(_:)))
        swipeDown.direction = UISwipeGestureRecognizerDirection.down
        swipeDown.delegate = self
        self.view.addGestureRecognizer(swipeDown)
        
//        let swipeDown = UIPanGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(_:)))
//        swipeDown.delegate = self
//        self.view.addGestureRecognizer(swipeDown)
        
        
    }
    
    func handleGesture(_ sender: UIGestureRecognizer) {
        if let panGesture = sender as? UIPanGestureRecognizer{
            
            let percentThreshold:CGFloat = 0.3
            
            // convert y-position to downward pull progress (percentage)
            let translation = panGesture.translation(in: view)
            let verticalMovement = translation.y / view.bounds.height
            let downwardMovement = fmaxf(Float(verticalMovement), 0.0)
            let downwardMovementPercent = fminf(downwardMovement, 1.0)
            let progress = CGFloat(downwardMovementPercent)
            
            guard let interactor = interactor else { return }
            
            switch sender.state {
            case .began:
//                player?.pause()
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
//                    player?.play()
                }
            default: break
            }
        }
    }
    
    
    // here are those protocol methods with Swift syntax
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        handleGesture(gestureRecognizer)
        return true
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return true
    }
    
    // Debugging - All Swipes Are Detected Now
    func respondToSwipeGesture(_ gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            if(swipeGesture.direction == .down){
                dismiss(animated: true, completion: nil)
            }
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cubeView.cubeDelegate = self
        configGesture()
        
       

        
//        let iv1 = UIImageView(image: UIImage(named: "img1"))
//        let iv2 = UIImageView(image: UIImage(named: "img2"))
//        let iv3 = UIImageView(image: UIImage(named: "img3"))
        
        
        cubeView.addChildViews([vid1.view, vid2.view, vid3.view, vid4.view])
        
        cubeView.scrollToViewAtIndex(2, animated: true)
        
        
    }

}
