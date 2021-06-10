//
//  profileViewController.swift
//  dyzAR
//
//  Created by Aashika Jagadeesh on 6/15/20.
//  Copyright © 2020 Aashika Jagadeesh. All rights reserved.
//

import UIKit
import FirebaseAuth
class profileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   @IBAction func viewTapped(_ sender: Any) {
    try! Auth.auth().signOut()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
