//
//  notesViewController.swift
//  dyzAR
//
//  Created by Aashika Jagadeesh on 5/18/20.
//  Copyright © 2020 Aashika Jagadeesh. All rights reserved.
//

import UIKit

class notesViewController: UIViewController {
    
    @IBOutlet var titleLabel:UILabel!
    @IBOutlet var noteLabel: UITextView!
    
    public var noteTitle:String = ""
    public var note:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel?.text = noteTitle
        noteLabel?.text = note
        
        // Do any additional setup after loading the view.
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
