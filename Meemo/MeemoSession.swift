//
//  MeemoSession.swift
//  
//
//  Created by Daniel Lohse on 4/29/17.
//
//

import Foundation


class MeemoSession: NSObject{
    
    var name: String?
    var duration: Int?
    var videoFileName: String?
    
    init(_ name: String, _ duration: Int, _ videoFileName: String){
        self.name = name
        self.duration = duration
        self.videoFileName = videoFileName
    }
    
}
