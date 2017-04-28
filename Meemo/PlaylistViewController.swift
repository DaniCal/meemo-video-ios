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

    var programNames: [String] = ["Authentic Leadership & Self-Awareness", "3 Ways to define personal achievement", "Leadership Advice from the best", "How to lead through Storytelling"]
    var programImageFileNames: [String] = ["img01", "img02", "img03", "img01"]
    var programAuthorNames: [String] = ["BILL GEORGE", "JULLIEN GORDON", "MARSHALL GOLDSMITH", "SHANE SHNOW"]
    var programDurations: [String] = ["WATCHED", "2:33", "3:10", "1:23"]
    var videoName: [String] = ["vid5", "vid4", "vid2", "vid6"]
    

    let videoSegueIdentifier = "goToVideo"

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //Triggers when segues to ProgramView
        if  segue.identifier == videoSegueIdentifier,
            let destination = segue.destination as? ModalViewController,
            let blogIndex = tableView.indexPathForSelectedRow?.row
        {
            destination.transitioningDelegate = self
            destination.interactor = interactor
            destination.videoName = videoName[blogIndex]
            //destination.program = content.programs[blogIndex]
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return programNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "playlistCell", for: indexPath) as! PlaylistTableViewCell
        cell.setProgramTitle(programNames[indexPath.row])
        cell.setProgramAuthor(programAuthorNames[indexPath.row])
        cell.setImageData(programImageFileNames[indexPath.row])
        cell.setProgramDuration(programDurations[indexPath.row])
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
