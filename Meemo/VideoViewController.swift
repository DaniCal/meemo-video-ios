//
//  VideoViewController.swift
//  Meemo
//
//  Created by Daniel Lohse on 4/26/17.
//  Copyright © 2017 Superstudio. All rights reserved.
//

import UIKit

import AVFoundation

class VideoViewController: UIViewController {
   
    @IBOutlet weak var button: UIButton!
    
    let videoTestURL = "https://firebasestorage.googleapis.com/v0/b/meemo-external-test.appspot.com/o/AuthenticLeadership.mp4?alt=media&token=2f20af88-6ca9-4b1b-8000-b21ff8da3676"
    var playerLayer:AVPlayerLayer?
    public var player:AVPlayer?
    var video:Bool = true


    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        playerLayer = AVPlayerLayer(player: player)
        playerLayer?.frame = self.view.bounds
        self.view.layer.addSublayer(playerLayer!)
        
        self.view.addSubview(button)
//        
//        let iv1 = UIImageView(image: UIImage(named: "img1"))
//        iv1.frame = self.view.bounds
//        self.view.layer.addSublayer(iv1.layer)
        
        
    }
    
    @IBAction func buttonAction(_ sender: AnyObject) {
        print("BingoBongo")
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

}
