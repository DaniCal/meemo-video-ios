//
//  VideoView.swift
//  Meemo
//
//  Created by Daniel Lohse on 4/27/17.
//  Copyright © 2017 Superstudio. All rights reserved.
//

import UIKit
import AVFoundation

@IBDesignable class VideoView: UIView {

    @IBOutlet weak var readMoreButton: UIButton!
    @IBOutlet weak var videoProgress: UIProgressView!
    @IBOutlet weak var containerView: UIView!
    

    @IBAction func readMore(_ sender: AnyObject) {
        
        print("Bingo Bongo")
    }
    
    open func setPogress(_ progress: Float){
        videoProgress.setProgress(progress, animated: true)
    }
    
    
    func showButton(){
        readMoreButton.isHidden = false
    }
    
    
    
    // Our custom view from the XIB file
    var view: UIView!
    
    let videoTestURL = "https://firebasestorage.googleapis.com/v0/b/meemo-external-test.appspot.com/o/AuthenticLeadership.mp4?alt=media&token=2f20af88-6ca9-4b1b-8000-b21ff8da3676"
    var playerLayer:AVPlayerLayer?
    public var player:AVPlayer?
    var video:Bool = true
    
    
    func xibSetup() {
        
        view = loadViewFromNib()
        // use bounds not frame or it'll be offset
        view.frame = bounds
        // Make the view stretch with containing view
        view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        // Adding custom subview on top of our view (over any custom drawing > see note below)

        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let view = UINib(nibName: "VideoView", bundle: bundle).instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
        
    }
    
    override func awakeFromNib(){
//        playerLayer = AVPlayerLayer(player: player)
//        playerLayer?.frame = view.bounds
//        self.view.layer.addSublayer(playerLayer!)
    }
    

    open func addVideoLayer(){
        playerLayer = AVPlayerLayer(player: player)
        playerLayer?.frame = self.view.bounds
        self.view.layer.addSublayer(playerLayer!)

    }
    
    
    open func playVideo(){
        let time = self.player?.currentTime()
        let videoString:String? = videoTestURL
        
        if let url = videoString {
            let videoURL = NSURL(string: url)
            self.player = AVPlayer(url: videoURL as! URL)
        }
        playerLayer = AVPlayerLayer(player: player)
        playerLayer?.bounds = containerView.bounds
        containerView.layer.addSublayer(playerLayer!)
        
        self.player?.play()
        if(time != nil){
            self.player?.seek(to: time!)
        }
        video = true
    }
    
    override init(frame: CGRect) {
        // 1. setup any properties here
        
        // 2. call super.init(frame:)
        super.init(frame: frame)
        
        // 3. Setup view from .xib file
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        // 1. setup any properties here
        
        // 2. call super.init(coder:)
        super.init(coder: aDecoder)
        
        // 3. Setup view from .xib file
        xibSetup()
    } 
}
