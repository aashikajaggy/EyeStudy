//
//  AppDelegate.swift
//  dyzAR
//
//  Created by Aashika Jagadeesh on 4/16/20.
//  Copyright © 2020 Aashika Jagadeesh. All rights reserved.
//

import UIKit
import CoreData
import Firebase
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UINavigationBar.appearance().barTintColor = UIColor(red: 28/255, green: 212/255, blue: 162/255, alpha: 0.5)
        UINavigationBar.appearance().tintColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 0.5)
        let font = UIFont(name: "Futura", size: 20)
        let attributes : [NSAttributedString.Key: AnyObject] = [
            NSAttributedString.Key.font: font!
        ]
        UINavigationBar.appearance().titleTextAttributes = attributes
        //UIApplication.shared.statusBarStyle = .lightContent
        FirebaseApp.configure()
        let authListener = Auth.auth().addStateDidChangeListener { auth, user in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if user != nil {
                userService.observeUserProfile((user?.uid)!) { userProfile in
                    userService.currentUserProfile = userProfile

                }
                let controller = storyboard.instantiateViewController(withIdentifier: "MainTabBarController") as! UITabBarController
                self.window?.rootViewController = controller
                self.window?.makeKeyAndVisible()
            } else {
                userService.currentUserProfile = nil
                //first page
                let controller = storyboard.instantiateViewController(withIdentifier: "MenuViewController") as! mainPageViewController
                self.window?.rootViewController = controller
                self.window?.makeKeyAndVisible()
            }
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
    //CoreData
    lazy var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "coreData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
               
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
               
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    
   
    

}

let appDelegate = UIApplication.shared.delegate as! AppDelegate?

var context = appDelegate?.persistentContainer.viewContext
