//
//  CourseViewController.swift
//  Meemo
//
//  Created by Daniel Lohse on 4/29/17.
//  Copyright © 2017 Superstudio. All rights reserved.
//

import UIKit

class CourseViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var courseAuthor: UILabel!
    @IBOutlet weak var imageBig: UIImageView!
    @IBOutlet weak var authorDescription: UILabel!
    @IBOutlet weak var courseTitle: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let videoSegueIdentifier = "goToVideo"

    let interactor = Interactor()

    
    var course:MeemoCourse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none
        initNavigationBar()
        
        tableView.backgroundColor = UIColor.clear
        tableView.isOpaque = false
        tableView.backgroundView = nil
        
        imageBig.image = UIImage(named: (course?.courseImageFileBig)!)
        courseTitle.text = course?.name
        courseAuthor.text = course?.author
        authorDescription.text = course?.authorDescription
        
        
    }
    
    func initNavigationBar(){
        //Make the navigation bar appear
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        //replace the back button image item
        var backBtn = UIImage(named: "nav_back_icon")
        backBtn = backBtn?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        self.navigationController?.navigationBar.backIndicatorImage =  backBtn
        self.navigationController!.navigationBar.backIndicatorTransitionMaskImage = backBtn;
        
        //replace the back button title
        self.navigationController?.navigationBar.backItem?.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        
        //Make the navigation bar transparaent
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    @IBAction func startCourse(_ sender: AnyObject) {
        if((course?.sessions.count)! > 0){
            self.performSegue(withIdentifier: videoSegueIdentifier , sender: nil)
        }
        

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
                if  segue.identifier == videoSegueIdentifier,
                    let destination = segue.destination as? ModalViewController,
                    let blogIndex = tableView.indexPathForSelectedRow?.row
                {
                    destination.transitioningDelegate = self
                    destination.interactor = interactor
                    destination.videoName = (course?.sessions[blogIndex].videoFileName)!
                    
                }else if segue.identifier == videoSegueIdentifier,
                    let destination = segue.destination as? ModalViewController
                {
                    destination.transitioningDelegate = self
                    destination.interactor = interactor
                    destination.videoName = (course?.sessions[0].videoFileName)!
                }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (course?.sessions.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "sessionCell", for: indexPath) as! SessionTableViewCell
        let session = self.course?.sessions[indexPath.row]
        cell.name.text = session!.name
        cell.isSessionlocked((session?.locked)!)
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(!(course?.sessions[indexPath.row].locked)!){
            self.performSegue(withIdentifier: videoSegueIdentifier , sender: indexPath)
        }        
        //tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension CourseViewController: UIViewControllerTransitioningDelegate {
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissAnimator()
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactor.hasStarted ? interactor : nil
    }
    
}
