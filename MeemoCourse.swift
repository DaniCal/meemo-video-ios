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
    var authorDescription:String?
        var numberOfSessions: Int?
        var courseImageFileSmall: String?
    var courseImageFileBig: String?
    var courseImageFileSquare: String?
    
        var sessions: [MeemoSession] = []
    
    init(_ name: String, _ author: String, _ authorDescription: String, _ numberOfSessions: Int, _ courseImageFileSmall:String, _ courseImageFileBig: String, _ courseImageFileSquare: String){
        self.name = name
        self.author = author
        self.authorDescription = authorDescription
        self.numberOfSessions = numberOfSessions
        self.courseImageFileSmall = courseImageFileSmall
        self.courseImageFileBig = courseImageFileBig
        self.courseImageFileSquare = courseImageFileSquare
    }
    
    func addSession(_ session: MeemoSession){
        sessions.append(session)
    }
    
    
    
    
    
}
