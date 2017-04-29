//
//  PlaylistViewController.swift
//  Meemo
//
//  Created by Daniel Lohse on 4/27/17.
//  Copyright © 2017 Superstudio. All rights reserved.
//

import UIKit

class PlaylistViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    @IBOutlet weak var tableView: UITableView!
    let interactor = Interactor()

//    var programNames: [String] = ["How to lead with authenticity", "Networking - What you need to know", "Get more done by applying 3 simple techniques", "How to give better advice & feedback", "How to lead through Storytelling"]
//    var programImageFileNames: [String] = ["img01", "img05", "img06", "img02", "img04"]
//    var programAuthorNames: [String] = ["BILL GEORGE", "BETTY LIU", "BRIAN CERVINO", "JULLIEN GORDON", "SHANE SHNOW"]
//    var programDurations: [String] = ["WATCHED","1:55", "2:33", "3:10", "1:23"]
//    var videoName: [String] = ["vid7", "vid5", "vid4", "vid8", "vid6"]
//    

    let videoSegueIdentifier = "goToVideo"

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var content:[MeemoCourse] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        content = appDelegate.content
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //Triggers when segues to ProgramView
        if  segue.identifier == videoSegueIdentifier,
            let destination = segue.destination as? ModalViewController,
            let blogIndex = tableView.indexPathForSelectedRow?.row
        {
            destination.transitioningDelegate = self
            destination.interactor = interactor
            destination.videoName = content[blogIndex].sessions[0].videoFileName!
            //destination.program = content.programs[blogIndex]
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return content.count
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "playlistCell", for: indexPath) as! PlaylistTableViewCell
        let meemoCourse:MeemoCourse = content[indexPath.row]
        
        cell.setProgramTitle(meemoCourse.name!)
        cell.setProgramAuthor(meemoCourse.author!)
        cell.setImageData(meemoCourse.courseImageFile!)
//        cell.setProgramDuration(programDurations[indexPath.row])
        //cell.setTitle(content.programs[indexPath.row].title)
        //cell.setSubtitle(content.programs[indexPath.row].subtitle)
//        if(content.programs[indexPath.row].pictureSquareData == nil){
//            loadProgramSquare(cell: cell, url: content.programs[indexPath.row].pictureSquare)
//        }else{
//            cell.setImageData(data: content.programs[indexPath.row].pictureSquareData)
//        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: videoSegueIdentifier , sender: indexPath)
        //tableView.deselectRow(at: indexPath, animated: true)
    }

}

extension PlaylistViewController: UIViewControllerTransitioningDelegate {
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissAnimator()
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactor.hasStarted ? interactor : nil
    }
    
}
