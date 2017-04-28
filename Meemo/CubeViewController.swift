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
    
    var swipeLeft = false
    
//    let vid1 = ModalViewController()
//    let vid2 = ModalViewController()
//    let vid3 = ModalViewController()
//    let vid4 = ModalViewController()
    
    @IBOutlet weak var cubeView: OHCubeView!
    var interactor:Interactor? = nil

    
    func cubeViewDidFinishScroll(toIndex: Int){
        print("I'm on page \(toIndex)")
        swipeLeft = false
        print("false")

        //TODO: Start playing the right video
    }
    
    
    func cubeViewDidScroll(_ cubeView: OHCubeView){
        swipeLeft = true
        print("true")
    }

    
    func configGesture(){
        let swipeDown = UIPanGestureRecognizer(target: self, action: #selector(handleGesture(_:)))
//        swipeDown.addTarget(self, action: #selector(handleGesture))
        swipeDown.delegate = self
        self.view.addGestureRecognizer(swipeDown)
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
            
            print(progress)
            
            if(swipeLeft || progress < 0.005){
                return
            }
            
            
            guard let interactor = interactor else { return }
            
            switch sender.state {
            case .began:
                
                if(interactor.hasStarted == false){
                    self.cubeView.disableScrollView()
                    interactor.hasStarted = true
                    dismiss(animated: true, completion: nil)
                }
                
            case .changed:
                interactor.shouldFinish = progress > percentThreshold
                interactor.update(progress)
            case .cancelled:
                interactor.hasStarted = false
                interactor.cancel()
                self.cubeView.enableScrollView()
            case .ended:
                interactor.hasStarted = false
                if(interactor.shouldFinish){
                    interactor.finish()
                }else{
                    interactor.cancel()
                }
                self.cubeView.enableScrollView()

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cubeView.cubeDelegate = self
        configGesture()
        
//        
        let iv1 = UIImageView(image: UIImage(named: "img1"))
        let iv2 = UIImageView(image: UIImage(named: "img2"))
        let iv3 = UIImageView(image: UIImage(named: "img3"))
        
//        let videoController1 = VideoViewController()
//        videoController1.loadView()
//        
//        let videoController2 = VideoViewController()
//        videoController1.loadView()
//        
//        videoController1.playVideo()


//        let videoView2 = VideoView.instanceViewFromNib()

        
//        let videoView1 = VideoView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
//        let videoView2 = VideoView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
//        let videoView3 = VideoView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
//        let videoView4 = VideoView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))

//        let video1 = ModalViewController()
        
//        videoView1.addVideoLayer()
//        videoView1.playVideo()
//        self.view.addSubview(videoView1)

//        let videoView2 = VideoView()
//
//        videoView1.addVideoLayer()
//        videoView1.playVideo()
        
        cubeView.addChildViews([iv1, iv2, iv3 ])
        
    }

}
