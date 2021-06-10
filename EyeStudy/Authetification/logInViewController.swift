//
//  logInViewController.swift
//  dyzAR
//
//  Created by Aashika Jagadeesh on 5/26/20.
//  Copyright © 2020 Aashika Jagadeesh. All rights reserved.
//

import UIKit
import Firebase
import AVFoundation
class logInViewController: UIViewController {

    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    
    @IBOutlet weak var logIncorrect: UILabel!
    
    let synthesizer = AVSpeechSynthesizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func logInPressed(_ sender: UIButton) {
        if let email = usernameField?.text, let password = passwordField?.text {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                guard let strongSelf = self else { return }
                if error == nil && authResult != nil {
                    self?.dismiss(animated: false, completion: nil)
                    
                } else {
                    print("error: \(error!.localizedDescription)")
                   
                    self?.reset()
                
                }
            }
        }
    }
    func reset() {
        usernameField?.text = ""
        passwordField?.text = ""
        logIncorrect?.isHidden = false
        let utterance = AVSpeechUtterance(string: "Incorrect log in information, please try again")
        synthesizer.speak(utterance)
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
