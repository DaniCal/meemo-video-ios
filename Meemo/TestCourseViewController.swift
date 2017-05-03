//
//  TestCourseViewController.swift
//  Meemo
//
//  Created by Daniel Lohse on 5/3/17.
//  Copyright © 2017 Superstudio. All rights reserved.
//

import UIKit

class TestCourseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var authorDescription: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var course:MeemoCourse?
    let interactor = Interactor()
    let videoSegueIdentifier = "goToVideo"


    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none
        
        tableView.backgroundColor = UIColor.clear
        tableView.isOpaque = false
        tableView.backgroundView = nil
        
        authorDescription.text = course?.authorDescription
        
        // Do any additional setup after loading the view.
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension TestCourseViewController: UIViewControllerTransitioningDelegate {
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissAnimator()
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactor.hasStarted ? interactor : nil
    }
    
}
