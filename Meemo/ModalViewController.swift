import UIKit
import AVFoundation

class ModalViewController: UIViewController {
    
    let summaryInteractor = Interactor()

    public var player:AVPlayer?
    var interactor:Interactor? = nil
    var video:Bool = true
    var playerLayer:AVPlayerLayer?
    var timer = Timer.init()
    var duration:Float = 120
    var overlay:VideoView?
    var summarySegueIdentifier:String = "summary"
    
    public var videoName:String = "vid2"
    
    let videoTestURL = "https://firebasestorage.googleapis.com/v0/b/meemo-external-test.appspot.com/o/Video.mp4?alt=media&token=88591412-30a1-4bdf-af82-6bffef5268d2"
    
    let audioTestURL = "https://firebasestorage.googleapis.com/v0/b/meemo-external-test.appspot.com/o/AuthenticLeadership.mp3?alt=media&token=3736b81e-bee5-494e-bd0b-fd0080b5a905"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "summary"){
            if let destinationViewController = segue.destination as? SummaryViewController {
                destinationViewController.transitioningDelegate = self
                destinationViewController.interactor = summaryInteractor
            }
        }
    }
    
    
    @IBAction func handleGesture(_ sender: UIPanGestureRecognizer) {

        let percentThreshold:CGFloat = 0.3
        
        // convert y-position to downward pull progress (percentage)
        let translation = sender.translation(in: view)
        let verticalMovement = translation.y / view.bounds.height
        
//        if(verticalMovement < 0){
//            let presentSummaryThreshold:CGFloat = 0.1
//            
//            let upwardMovement = fminf(Float(verticalMovement), 0.0)
//            let upwardMovementPercent = fmaxf(upwardMovement, 1.0)
//            let upwardProgress = CGFloat(upwardMovementPercent)
//            
//            print(upwardMovement)
//            
//            //TODO: Initiate Present SummaryView Segue and take
//            
//        }
        
        
        let downwardMovement = fmaxf(Float(verticalMovement), 0.0)
        let downwardMovementPercent = fminf(downwardMovement, 1.0)
        let progress = CGFloat(downwardMovementPercent)
        
        guard let interactor = interactor else { return }
        
        switch sender.state {
        case .began:
            player?.pause()
            timer.invalidate()
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
                 timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateVideoProgress), userInfo: nil,repeats: true)
            }
        default: break
            
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
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
//        let videoString:String? = videoTestURL
        
//        if let url = videoString {
//            let videoURL = NSURL(string: url)
//            self.player = AVPlayer(url: videoURL as! URL)
//        }
        
        let path = Bundle.main.path(forResource: videoName, ofType:"mov")
        
        self.player = AVPlayer(url: URL(fileURLWithPath: path!))
        
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
         timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.updateVideoProgress), userInfo: nil,repeats: true)
        
        overlay = VideoView()
        overlay?.frame = self.view.bounds
        self.view.addSubview(overlay!)
        overlay?.readMoreButton.addTarget(self, action: #selector(self.showSummaryView), for: UIControlEvents.touchUpInside)
        
    }
    
    func updateVideoProgress(){
        let ratio = Float((self.player?.currentTime().seconds)!) / self.duration
        overlay?.setPogress(ratio)
    }
    
    func showSummaryView(){
        self.performSegue(withIdentifier: summarySegueIdentifier , sender: nil)

    }
}



extension ModalViewController: UIViewControllerTransitioningDelegate {
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissAnimator()
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return summaryInteractor.hasStarted ? summaryInteractor : nil
    }
    
}
