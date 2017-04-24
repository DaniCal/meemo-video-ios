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
    var video:Bool = true
    var playerLayer:AVPlayerLayer?
    
     let videoTestURL = "https://firebasestorage.googleapis.com/v0/b/meemo-external-test.appspot.com/o/AuthenticLeadership.mp4?alt=media&token=2f20af88-6ca9-4b1b-8000-b21ff8da3676"
    
    let audioTestURL = "https://firebasestorage.googleapis.com/v0/b/meemo-external-test.appspot.com/o/AuthenticLeadership.mp3?alt=media&token=3736b81e-bee5-494e-bd0b-fd0080b5a905"
    
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
    
    
    @IBAction func videoOnOff(_ sender: AnyObject) {
        if(video){
            playAudio()
        }else{
            playVideo()
        }
    }
    
    func playVideo(){
        let time = self.player?.currentTime()
        let videoString:String? = videoTestURL
        
        if let url = videoString {
            let videoURL = NSURL(string: url)
            self.player = AVPlayer(url: videoURL as! URL)
        }
        playerLayer = AVPlayerLayer(player: player)
        playerLayer?.frame = self.view.bounds
        self.view.layer.addSublayer(playerLayer!)
        self.player?.play()
        if(time != nil){
         self.player?.seek(to: time!)
        }
        video = true
    }
    
    func playAudio(){
        let time = self.player?.currentTime()
        self.player?.pause()
        playerLayer?.removeFromSuperlayer()
        let audioString:String? = audioTestURL
        
        if let url = audioString {
            let audioURL = NSURL(string: url)
            self.player = AVPlayer(url: audioURL as! URL)
        }
        self.player?.play()
        self.player?.seek(to: time!)
        video = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.player?.pause()

        playVideo()
    }
    
}
