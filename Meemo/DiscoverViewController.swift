//
//  DiscoverViewController.swift
//  Meemo
//
//  Created by Daniel Lohse on 5/4/17.
//  Copyright © 2017 Superstudio. All rights reserved.
//

import UIKit

class DiscoverViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let courseSegueIdentifier = "goToCourse"

    var content:[MeemoCourse] = []
    var contentMixed:[MeemoCourse] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        content = appDelegate.content

    }
}

extension DiscoverViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5//content.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "discoverCell", for: indexPath) as! DiscoverCollectionViewCell
        cell.course = content[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        self.performSegue(withIdentifier: courseSegueIdentifier , sender: indexPath)

    }
}
