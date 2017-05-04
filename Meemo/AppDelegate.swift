//
//  AppDelegate.swift
//  Meemo
//
//  Created by Daniel Lohse on 4/21/17.
//  Copyright © 2017 Superstudio. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var content: [MeemoCourse] = []
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        createMockupData()
        
        return true
    }
    
    
    func createMockupData(){
        
        //AUTHORDESCRIPTIONS
        
        let billDescription = "Bill is a Harvard Business School professor. He serves on the boards of directors of Exxon Mobil and Goldman Sachs"
        let bettyDescription = "Betty is a news anchor for Bloomberg and award-winning journalist. She’s interviewed Warren Buffett & Lloyd Blankfein."
        let brianDescription = "Brian is the Product Marketing Manager at Trello. He as trained people around the world how to tet more done every day. "
        let jullienDescription = "Jullien Gordon is a life coach and has worked with Fortune 500 companies. He is the creator of The Innerview."
        let shaneDescription = "Shane Snow is Co-Founder & CCO of Contently, and an award-winning journalist, and author."
        
        
        //COURSES
        let course_1 = MeemoCourse("Authentic Leadership & Self-Awareness", "BILL GEORGE", billDescription, 8, "01_bill", "01_bill_big", "01_bill_square")
        let course_2 = MeemoCourse("Become career ready - What you need to know", "BETTY LIU", bettyDescription, 6, "02_betty", "02_betty_big", "02_betty_square")
        let course_3 = MeemoCourse("Simple techniques to get more done", "BRIAN CERVINO", brianDescription, 4, "03_brian", "03_brian_big", "03_brian_square")
        let course_4 = MeemoCourse("Qualities of a great mentor", "JULLIEN GORDON", jullienDescription, 6, "04_jullien", "04_jullien_big", "03_brian_big")
        let course_5 = MeemoCourse("How to lead through Storytelling", "SHANE SNOW", shaneDescription ,10, "05_shane","05_shane_big", "05_shane_square")

        //COURSE 01 - BILL GEORGE
        let session_1_1 = MeemoSession("Become Self-Aware", 296, "01_bill")
        session_1_1.unlockSession()
        let session_1_2 = MeemoSession("Understand your desires and fears", 96, "01_bill")
        let session_1_3 = MeemoSession("Find pride", 99, "01_bill")
        let session_1_4 = MeemoSession("Know your life story", 241, "01_bill")
        let session_1_5 = MeemoSession("Consider your crucibles", 245, "01_bill")
        let session_1_6 = MeemoSession("Learn to reflect", 168, "01_bill")
        let session_1_7 = MeemoSession("Seek Feedback", 296, "01_bill")
        let session_1_8 = MeemoSession("Accept yourself", 267, "01_bill")
    
        course_1.addSession(session_1_1)
        course_1.addSession(session_1_2)
        course_1.addSession(session_1_3)
        course_1.addSession(session_1_4)
        course_1.addSession(session_1_5)
        course_1.addSession(session_1_6)
        course_1.addSession(session_1_7)
        course_1.addSession(session_1_8)
        
        //COURSE 02 - BETTY LIU
        let session_2_1 = MeemoSession("Authentic networking", 86, "02_betty")
        session_2_1.unlockSession()
        let session_2_2 = MeemoSession("How are you perceived?", 86, "02_betty")
        let session_2_3 = MeemoSession("Find your brand?", 86, "02_betty")
        let session_2_4 = MeemoSession("Inbound Networking", 86, "02_betty")
        let session_2_5 = MeemoSession("Find the right timing", 86, "02_betty")
        let session_2_6 = MeemoSession("Care and maintain connections", 86, "02_betty")
        let session_2_7 = MeemoSession("Look for opportunity", 86, "02_betty")
        
        course_2.addSession(session_2_1)
        course_2.addSession(session_2_2)
        course_2.addSession(session_2_3)
        course_2.addSession(session_2_4)
        course_2.addSession(session_2_5)
        course_2.addSession(session_2_6)
        course_2.addSession(session_2_7)
        
        
        //COURSE 03 - BRIAN CERVINO
        let session_3_1 = MeemoSession("Your first 3 Producivity hacks", 296, "03_brian")
        session_3_1.unlockSession()
        let session_3_2 = MeemoSession("Setting the right goals", 96, "03_brian")
        let session_3_3 = MeemoSession("How to prioritize", 99, "03_brian")
        let session_3_4 = MeemoSession("Tools for better Time Management", 241, "03_brian")
        
        course_3.addSession(session_3_1)
        course_3.addSession(session_3_2)
        course_3.addSession(session_3_3)
        course_3.addSession(session_3_4)
        
        
        
        //COURSE 04 - JULLIEN GORDON
        let session_4_1 = MeemoSession("How to give better advice and feedback", 245, "04_jullien")
        let session_4_2 = MeemoSession("Becoming a role model", 245, "04_jullien")
        let session_4_3 = MeemoSession("Value the opinions of others", 245, "04_jullien")
        let session_4_4 = MeemoSession("Show enthusiasm in your field", 245, "04_jullien")


        session_4_1.unlockSession()
        course_4.addSession(session_4_1)
        course_4.addSession(session_4_2)
        course_4.addSession(session_4_3)
        course_4.addSession(session_4_4)
        
        //COURSE 05 - SHANE SNOW
        let session_5_1 = MeemoSession("The impact of storytelling", 234, "05_shane")
        let session_5_2 = MeemoSession("Elements of effective storytelling", 234, "05_shane")
        let session_5_3 = MeemoSession("Storytelling to build relationships", 234, "05_shane")
        let session_5_4 = MeemoSession("The power of storytelling in marketing", 234, "05_shane")
        let session_5_5 = MeemoSession("The storytelling matrix", 234, "05_shane")




        session_5_1.unlockSession()
        
        course_5.addSession(session_5_1)
        course_5.addSession(session_5_2)
        course_5.addSession(session_5_3)
        course_5.addSession(session_5_4)
        course_5.addSession(session_5_5)
        
        content.append(contentsOf: [course_1, course_2, course_3, course_4, course_5])
        
        
    }
    
  

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

