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
    
     let testURL = "https://firebasestorage.googleapis.com/v0/b/meemo-external-test.appspot.com/o/AuthenticLeadership.mp4?alt=media&token=2f20af88-6ca9-4b1b-8000-b21ff8da3676"
    
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
        
        let videoString:String? = testURL
        
        if let url = videoString {
            let videoURL = NSURL(string: url)
            self.player = AVPlayer(url: videoURL as! URL)
            //self.playerController.player = self.player
        }
        
        
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        self.view.layer.addSublayer(playerLayer)
        self.player?.play()

    }
    
}
