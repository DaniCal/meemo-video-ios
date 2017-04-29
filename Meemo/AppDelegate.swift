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
        let course_1 = MeemoCourse("How to lead with authenticity", "BILL GEORGE", 6, "img01")
        let course_2 = MeemoCourse("Networking - What you need to know", "BETTY LIU", 6, "img05")
        let course_3 = MeemoCourse("Get more done by applying 3 simple techniques", "BRIAN CERVINO", 6, "img06")
        let course_4 = MeemoCourse("How to give better advice & feedback", "JULLIEN GORDON", 6, "img02")
        let course_5 = MeemoCourse("How to lead through Storytelling", "SHANE SNOW" ,6, "img04")

        let session_1_1 = MeemoSession("Become Self-Aware", 296, "vid7")
        
        course_1.addSession(session_1_1)
        course_1.addSession(session_1_1)
        
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

