//
//  DiscoverViewController.swift
//  Meemo
//
//  Created by Daniel Lohse on 5/4/17.
//  Copyright © 2017 Superstudio. All rights reserved.
//

import UIKit

class DiscoverViewController: UIViewController {

    @IBOutlet weak var collectionViewA: UICollectionView!
    @IBOutlet weak var collectionViewB: UICollectionView!
    
    @IBOutlet weak var dailyInspirationImage: UIImageView!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let courseSegueIdentifier = "goToCourse"
    let videoSegueIdentifier = "goToVideo"

    var selectedItem:Int = 0
    var content:[MeemoCourse] = []
    var contentMixed:[MeemoCourse] = []
    
    let interactor = Interactor()

    @IBAction func playInspiration(_ sender: AnyObject) {
        self.performSegue(withIdentifier: videoSegueIdentifier , sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        content = appDelegate.content
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.navigationBar.isHidden = true

        view.backgroundColor = UIColor(red: 21.0/255, green: 21.0/255, blue: 24.0/255, alpha: 1.0)
        dailyInspirationImage.layer.cornerRadius = 2.0

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //Triggers when segues to ProgramView
        if  segue.identifier == courseSegueIdentifier,
            let destination = segue.destination as? MainCourseViewController
        {
            destination.course = content[selectedItem]
            
        }
        else if  segue.identifier == videoSegueIdentifier,
            let destination = segue.destination as? ModalViewController
        {
            destination.transitioningDelegate = self
            destination.interactor = interactor
            destination.videoName = "01_bill"
            
        }
        
        
    }
    
//    func hideNavigationBar(){
//        self.navigationController?.navigationBar.isTranslucent = true
//        self.navigationController?.setNavigationBarHidden(true, animated: true)
//    }
    

}

extension DiscoverViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return content.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if(collectionView == self.collectionViewA){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "discoverCell", for: indexPath) as! DiscoverCollectionViewCell
            cell.course = content[indexPath.item]
            
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "discoverCell", for: indexPath) as! DiscoverCollectionViewCell
            cell.course = content[content.count - indexPath.item - 1]
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        if(collectionView == self.collectionViewA){
            self.selectedItem = indexPath.row
        }else{
            self.selectedItem = content.count - indexPath.row - 1
        }
        
        self.performSegue(withIdentifier: courseSegueIdentifier , sender: indexPath)

    }
}

extension DiscoverViewController: UIViewControllerTransitioningDelegate {
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissAnimator()
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactor.hasStarted ? interactor : nil
    }
    
}
