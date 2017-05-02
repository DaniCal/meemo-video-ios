//
//  MeemoCourse.swift
//  
//
//  Created by Daniel Lohse on 4/29/17.
//
//

import Foundation

class MeemoCourse: NSObject{
        var name: String?
        var author: String?
        var numberOfSessions: Int?
        var courseImageFileSmall: String?
    var courseImageFileBig: String?
    
        var sessions: [MeemoSession] = []
    
    init(_ name: String, _ author: String, _ numberOfSessions: Int, _ courseImageFileSmall:String, _ courseImageFileBig: String){
        self.name = name
        self.author = author
        self.numberOfSessions = numberOfSessions
        self.courseImageFileSmall = courseImageFileSmall
        self.courseImageFileBig = courseImageFileBig
    }
    
    func addSession(_ session: MeemoSession){
        sessions.append(session)
    }
    
    
    
    
}
