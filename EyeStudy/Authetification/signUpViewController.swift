//
//  signUpViewController.swift
//  dyzAR
//
//  Created by Aashika Jagadeesh on 5/25/20.
//  Copyright © 2020 Aashika Jagadeesh. All rights reserved.
//

import UIKit
import AVFoundation
import Firebase

class signUpViewController: UIViewController {
    let synthesizer = AVSpeechSynthesizer()
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var fullNameField: UITextField!

    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var confirmPasswordField: UITextField!
    
    @IBOutlet weak var passwordLength: UILabel!
    
    @IBOutlet weak var confirmError: UILabel!
    
    @IBOutlet weak var signUpMessage: UILabel!
    
    @IBOutlet weak var next1Outlet: UIButton!
    
    @IBOutlet weak var otherError: UILabel!
    
    var imagePicker: UIImagePickerController!
  
  
    @IBOutlet weak var profileImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        

        //let utterance = AVSpeechUtterance(string: signUpMessage.text!)
        //synthesizer.speak(utterance)
        let utterance1 = AVSpeechUtterance(string: "Sign Up")
        synthesizer.speak(utterance1)
        imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changeProfilePic))
        tapGestureRecognizer.numberOfTapsRequired = 1
        profileImageView.addGestureRecognizer(tapGestureRecognizer)
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
    
        // Do any additional setup after loading the view.
    }
    
    @objc func changeProfilePic () {
        let utterance = AVSpeechUtterance(string: "Change profile picture by choosing from your camera roll")
        synthesizer.speak(utterance)
        self.present(imagePicker, animated: true, completion: nil)
    }
    var check = 0
    func checkLength () {

        if (passwordField?.text!.count)! < 7 && passwordField?.text != "" {
            print(passwordField?.text!.count ?? 0)
           passwordField.isHidden = false
            let utterance = AVSpeechUtterance(string: "Password should be atleast seven characters long, please try again.")
            synthesizer.speak(utterance)
            passwordField?.text = ""
            confirmPasswordField?.text = ""
        } else {
            check += 1
        }
    }
    func checkIfMatch () {
        if confirmPasswordField?.text != passwordField?.text {
            confirmError?.isHidden = false
            let utterance = AVSpeechUtterance(string: "The passwords do not match, please try again.")
            synthesizer.speak(utterance)
            confirmPasswordField?.text = ""
            passwordField?.text = ""
        } else {
           confirmError?.isHidden = true
           check += 1
        }
    }
    func checkForEmpty () {
        if emailField?.text == "" || fullNameField?.text == "" || passwordField?.text == "" || confirmPasswordField?.text == "" || usernameField?.text == "" {
            let utterance = AVSpeechUtterance(string: "All fields are required, please fill all of them before clicking next.")
            synthesizer.speak(utterance)
        } else {
            check += 1
        }
    
    }
    
    @IBAction func next1Btn(_ sender: UIButton) {
        checkForEmpty()
        checkLength()
        checkIfMatch()
       
        if check == 3 {
            if let email = emailField?.text, let password = passwordField?.text, let username = usernameField?.text, let name = fullNameField?.text,let image = profileImageView.image{
                Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                    if error == nil && authResult != nil {
                        print("User created!")
                        self.dismiss(animated: false, completion: nil)
                        uploadProfilePic(image) { url in
                            
                            if url != nil {
                                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                                changeRequest?.displayName = username
                                changeRequest?.photoURL = url
                                
                                changeRequest?.commitChanges { error in
                                    if error == nil {
                                        print("User display name changed!")
                                        saveProfile(username: username, profileImageURL: url!, name: name) { success in
                                            if success {
                                               self.dismiss(animated: true, completion: nil)
                                            } else {
                                              self.reset()
                                                self.otherError?.text = error!.localizedDescription
                                                let utterance = AVSpeechUtterance(string: error!.localizedDescription + "please type a new username or password")
                                                self.synthesizer.speak(utterance)
                                            }
                                        }
                                        //self.dismiss(animated: false, completion: nil)
                                    } else {
                                        print("error: \(error!.localizedDescription)")
                                        self.reset()
                                        self.otherError?.text = error!.localizedDescription
                                        let utterance = AVSpeechUtterance(string: error!.localizedDescription + "please type a new username or password")
                                        self.synthesizer.speak(utterance)
                                    }
                                }
                            } else {
                                //Error unable to upload profile image
                                self.reset()
                                self.otherError?.text = error!.localizedDescription
                                let utterance = AVSpeechUtterance(string: error!.localizedDescription + "please type a new username or password")
                                self.synthesizer.speak(utterance)
                            }

                        }
         
                    } else {
                        print("error: \(error!.localizedDescription)")
                        self.reset()
                        self.otherError?.text = error!.localizedDescription
                        let utterance = AVSpeechUtterance(string: error!.localizedDescription + "please type a new username or password")
                        self.synthesizer.speak(utterance)
                    }
                }
            }
            /*
            if let email = emailField?.text, let password = passwordField?.text {
                print("yo yo she be running the right statement")
                Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                    guard self != nil else { return }
                    if error != nil {
                        print("yo yo she be running the wrong statements")
                        // Create Account
                    } else {
                        print("yo yo she be running the right statement")
                        let saveSuccessful: Bool = KeychainWrapper.standard.set(authResult!.user.uid, forKey: "KEY_ID")
                        self?.performSegue(withIdentifier: "feed", sender: nil)
                        
                    }
                    
                }
                   
                
                
                
            }
          */
            func uploadProfilePic (_ image: UIImage, completion: @escaping ((_ url: URL?) -> ())) {
                guard let uid = Auth.auth().currentUser?.uid else {return}
                let storageRef = Storage.storage().reference().child("user/\(uid)")
                guard let imageData = image.jpegData(compressionQuality: 0.75) else {return}
                let metaData = StorageMetadata()
                metaData.contentType = "img/jpg"
              
                storageRef.putData(imageData, metadata: metaData) {metaData, error in
                    if error == nil, metaData != nil {
                        
                        storageRef.downloadURL { url, error in
                            completion(url)
                            // success!
                        }
                    } else {
                        //failure
                        completion(nil)
                    }
                }
            }
            func saveProfile (username: String, profileImageURL: URL, name: String, completion: @escaping ((_ success: Bool)->()) ) {
               guard let uid = Auth.auth().currentUser?.uid else {return}
               let databaseRef = Database.database().reference().child("users/profile/\(uid)")
               let userObject = [
                "username" : username,
                "photoURL" : profileImageURL.absoluteString,
                "name" : name
                ] as [String:Any]
                databaseRef.setValue(userObject) { error, ref in
                    completion(error == nil)
                }
            }
        }
      check = 0
    }
    
    @IBAction func signUpToShare(_ sender: Any) {
        let utterance = AVSpeechUtterance(string: "Sign up to share and view all kinds of study resources! All work is specially customized for the blind, dyslexic, and visually impaired.")
        synthesizer.speak(utterance)
    }
    func reset() {
        usernameField?.text = ""
        passwordField?.text = ""
        confirmPasswordField?.text = ""
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
extension signUpViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        if let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.profileImageView.image = pickedImage
        }
    }
}
