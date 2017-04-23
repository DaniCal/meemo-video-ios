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
    
    var playerController = AVPlayerViewController()
    var player:AVPlayer?
    
    let interactor = Interactor()
    
    let testURL = "https://firebasestorage.googleapis.com/v0/b/meemo-external-test.appspot.com/o/Video.mp4?alt=media&token=88591412-30a1-4bdf-af82-6bffef5268d2"

    @IBAction func playVideo(_ sender: AnyObject) {
        self.present(self.playerController, animated: true, completion:{
            self.playerController.player?.play()
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? ModalViewController {
            destinationViewController.transitioningDelegate = self
            destinationViewController.interactor = interactor
            let playerLayer = AVPlayerLayer(player: player)
            playerLayer.frame = destinationViewController.view.bounds
            destinationViewController.view.layer.addSublayer(playerLayer)
            destinationViewController.player = self.player
            self.player?.play()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let videoString:String? = testURL
    
        if let url = videoString {
            let videoURL = NSURL(string: url)
            self.player = AVPlayer(url: videoURL as! URL)
            self.playerController.player = self.player
        }
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
