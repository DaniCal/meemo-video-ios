import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController {
    
    let interactor = Interactor()
    
    
    /*
     TODO
     - Table with video content (Missing: Main Design)
     - Link data from tableview with the UI (ModalViewController & SummaryViewController)
     - Swip up to present SummaryViewModal (Research web)
     - Replace video with proper UI when only audio is playing
     - Add coundown (bar or as a number) about the remaining time playing
     */
 

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "modal"){
            if let destinationViewController = segue.destination as? ModalViewController {
                destinationViewController.transitioningDelegate = self
                destinationViewController.interactor = interactor
            }
        }
        if(segue.identifier == "cube"){
            if let destinationViewController = segue.destination as? CubeViewController {
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
