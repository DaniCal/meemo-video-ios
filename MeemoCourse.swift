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
        var courseImageFile: String?
        var sessions: [MeemoSession] = []
    
    init(_ name: String, _ author: String, _ numberOfSessions: Int, _ courseImageFile:String){
        self.name = name
        self.author = author
        self.numberOfSessions = numberOfSessions
        self.courseImageFile = courseImageFile
    }
    
    func addSession(_ session: MeemoSession){
        sessions.append(session)
    }
    
    
    
    
}
