//
//  Camera1ViewController.swift
//  dyzAR
//
//  Created by Aashika Jagadeesh on 4/21/20.
//  Copyright © 2020 Aashika Jagadeesh. All rights reserved.
//

import UIKit


class Camera1ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var userImage: UIImageView!
    var userImg: UIImage!
    
    let image = UIImagePickerController()
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tesseractSegue" {
            let dvc = segue.destination as! ViewController
            dvc.userImg = userImage.image
        }
    }
    
    @IBAction func uploadPuc(_ sender: Any) {
        image.delegate = self
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        image.allowsEditing = true
        self.present(image, animated: true) {
            
        }
    }
    
    @IBAction func takePic(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
         
         //image.delegate = self
         image.sourceType = .camera
         //image.allowsEditing = true
        self.present(image, animated: true)
        } else {
            print("Camera Unavailable")
            let prob = UIAlertController(title: "Camera Unavailable", message: "Please check if your using a device with a camera.", preferredStyle: .actionSheet)
           let dismissAction = UIAlertAction(title: "Ok", style: .default, handler: {action in
            prob.dismiss(animated: true, completion: nil)
          } )
           prob.addAction(dismissAction)
            self.present(prob, animated: true)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            userImage.image = image
        } else {
            
        }
        self.dismiss(animated: true, completion: nil)
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
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


