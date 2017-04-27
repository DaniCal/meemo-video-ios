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
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "playlistCell", for: indexPath) as! PlaylistTableViewCell
        //cell.setTitle(content.programs[indexPath.row].title)
        //cell.setSubtitle(content.programs[indexPath.row].subtitle)
//        if(content.programs[indexPath.row].pictureSquareData == nil){
//            loadProgramSquare(cell: cell, url: content.programs[indexPath.row].pictureSquare)
//        }else{
//            cell.setImageData(data: content.programs[indexPath.row].pictureSquareData)
//        }
        
        
        return cell
    }

}
