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
    
    var content:[MeemoCourse] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension DiscoverViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5//content.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "discoverCell", for: indexPath) as! DiscoverCollectionViewCell
        //cell.course = content[indexPath.item]
        
        return cell
    }
}
