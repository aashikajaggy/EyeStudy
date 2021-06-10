//
//  newPostViewController.swift
//  dyzAR
//
//  Created by Aashika Jagadeesh on 5/31/20.
//  Copyright © 2020 Aashika Jagadeesh. All rights reserved.
//

import UIKit
import AVFoundation
import Firebase
class newPostViewController: UIViewController, UITextViewDelegate {
    let synthesizer = AVSpeechSynthesizer()
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn56: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var largeView: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var linkField: UITextField!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descriptionField: UITextView!
    @IBOutlet weak var clearBraille: UIButton!
    
    @IBOutlet weak var switchToBraille: UIButton!
    @IBOutlet weak var shadedView: UIView!  //hidden view
    @IBOutlet weak var customLabel: UILabel! //label inside hidden view
    /*
    var post = [AnyObject?]()
    var loggedInUser : AnyObject?
    var loggedInUserData : AnyObject?
    let databaseRef = Database.database().reference()
 */
    var editTitle : Bool = false
    var editLink : Bool = false
    var editDesc : Bool = false
    var titleString : String = ""
    var linkString: String = ""
    var descString : String = ""
    let customArray = ["Braille Keyboard", "Disable Braille Keyboard", "Post"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btn1.layer.cornerRadius = btn1.frame.size.width/2
        btn2.layer.cornerRadius = btn2.frame.size.width/2
        btn3.layer.cornerRadius = btn3.frame.size.width/2
        btn4.layer.cornerRadius = btn4.frame.size.width/2
        btn5.layer.cornerRadius = btn5.frame.size.width/2
        btn56.layer.cornerRadius = btn56.frame.size.width/2
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapGesture))
        tapGesture.numberOfTapsRequired = 2
        btn56.addGestureRecognizer(tapGesture)
        
        titleField.addTarget(self, action: #selector(myTargetFunction), for: .touchDown)
        linkField.addTarget(self, action: #selector(linkTap), for: .touchDown)
        descriptionField.delegate = self
        clearBraille.addTarget(self, action: #selector(readString), for: .touchUpInside)
        clearBraille.addTarget(self, action: #selector(ifExitSelected), for: .touchUpInside)
        switchToBraille.addTarget(self, action: #selector(switchItToBraille), for: .touchUpInside)
        let rotate = UIRotationGestureRecognizer(target: self, action: #selector(handleRotate(sender:)))
        view.addGestureRecognizer(rotate)
        // Do any additional setup after loading the view.
        //grabAuthor()
    }

    var index = 0
    @objc func handleRotate (sender: UIRotationGestureRecognizer) {
        guard sender.view != nil else {return}
         
        if sender.state == .began || sender.state == .changed {
            shadedView.isHidden = false
            customLabel.isHidden = false
            customLabel.text = customArray[index]
            
           
        } else if sender.state == .ended {
            let utterance1 = AVSpeechUtterance(string: (customLabel?.text)!)
            synthesizer.speak(utterance1)
            if index == customArray.count - 1{
                index = 0
                sender.rotation = 0
            } else {
                index += 1
                sender.rotation = 0
             }
            if customLabel?.text == "Braille Keyboard" {
                switchItToBraille()

            } else if customLabel?.text == "Post" {
                print("post")
                //create alert
            } else if customLabel?.text == "Disable Braille Keyboard" {
                ifExitSelected()
            }
               
            shadedView.isHidden = true
            customLabel.isHidden = true
            
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        descTap()
    }
    
   // func textViewDidEndEditing(_ textView: UITextView) {
       // let utterance1 = AVSpeechUtterance(string: descString)
        //synthesizer.speak(utterance1)
   // }
    
    @objc func myTargetFunction(textField: UITextField) {
        let utterance1 = AVSpeechUtterance(string: "Typing title")
        synthesizer.speak(utterance1)
        word = ""
        editTitle = true
        editLink = false
        editDesc = false
    }

    
    @objc func linkTap() {
        let utterance1 = AVSpeechUtterance(string: "Typing link")
               synthesizer.speak(utterance1)
               word = ""
               editTitle = false
               editLink = true
               editDesc = false
    }

    
    @objc func descTap() {
        let utterance1 = AVSpeechUtterance(string: "Typing description")
        synthesizer.speak(utterance1)
        word = ""
        editTitle = false
        editLink = false
        editDesc = true
    }
  
    var titles = [[0,0,0,0,0,0,0]]
    var titleLetter = 0
    var link = [[0,0,0,0,0,0,0]]
    var linkChar = 0
    var letters = [[0,0,0,0,0,0,0]]
    var letter = 0
    
    var c1: Int = 0
    var c2: Int = 0
    var c3: Int = 0
    var c4: Int = 0
    var c5: Int = 0
    var c6: Int = 0
    @objc func ifExitSelected() {
       btn1.isHidden = true
       btn2.isHidden = true
       btn3.isHidden = true
       btn4.isHidden = true
       btn5.isHidden = true
       backBtn.isHidden = true
       nextBtn.isHidden = true
       largeView.isHidden = true
       contentView.isHidden = true
       clearBraille.isHidden = true
       titleField?.isUserInteractionEnabled = true
       descriptionField?.isUserInteractionEnabled = true
       linkField?.isUserInteractionEnabled = true
    }
    
    @objc func switchItToBraille() {
        largeView.isHidden = false
        contentView.isHidden = false
        btn1.isHidden = false
        btn2.isHidden = false
        btn3.isHidden = false
        btn4.isHidden = false
        btn5.isHidden = false
        backBtn.isHidden = false
        nextBtn.isHidden = false
        clearBraille.isHidden = false
        titleField?.isUserInteractionEnabled = false
        descriptionField?.isUserInteractionEnabled = false
        linkField?.isUserInteractionEnabled = false
        
    }
    @objc func readString () {
        if editTitle == true {
            let utterance1 = AVSpeechUtterance(string: (titleField?.text)!)
            synthesizer.speak(utterance1)
        } else if editLink == true {
            let utterance1 = AVSpeechUtterance(string: (linkField.text)!)
            synthesizer.speak(utterance1)
        } else if editDesc == true {
            let utterance1 = AVSpeechUtterance(string: (descriptionField.text)!)
            synthesizer.speak(utterance1)
        }
        
        
    }
    var tempLetter = ""
    func readLetterTemp (array: [[Int]], index: Int) {
        for term in 0...36{
            let array1 = [index, library.list[term].Circle1, library.list[term].Circle2, library.list[term].Circle3, library.list[term].Circle4, library.list[term].Circle5, library.list[term].Circle6]
                if array[index] == array1 {
                    tempLetter = String(library.list[term].letter)
                    if array == titles {
                      titleField?.text = titleString + tempLetter
                    } else if array == link {
                      linkField?.text = linkString + tempLetter
                    } else if array == letters {
                       descriptionField?.text = descString + tempLetter
                    }
                    
                }
        }
    }
    
    var word = ""
    func wordRead (array: [[Int]], index: Int) {
        if array[index] == [index,0,0,0,0,0,0] {
            let utterance = AVSpeechUtterance(string: word)
            synthesizer.speak(utterance)
            self.word = ""
        }
    }
    var audioPlayer: AVAudioPlayer?
    var library = brailleAlphabet()
    @IBAction func btn1(_ sender: UIButton) {
        let path = Bundle.main.path(forResource: "keyboard", ofType:"mp3")
        let url = URL(fileURLWithPath: path!)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
            // couldn't load file :(
        }
        
        c1 = 1
        if editTitle == true {
           titles[titleLetter][1] = c1
           readLetterTemp(array: titles, index: titleLetter)
        } else if editLink == true {
            link[linkChar][1] = c1
            readLetterTemp(array: link, index: linkChar)
        } else if editDesc == true {
            letters[letter][1] = c1
            readLetterTemp(array: letters, index: letter)
        }
        

    }
    
    @IBAction func btn2(_ sender: Any) {
        let path = Bundle.main.path(forResource: "keyboard", ofType:"mp3")
        let url = URL(fileURLWithPath: path!)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
            // couldn't load file :(
        }
        c2 = 1
        if editTitle == true {
           titles[titleLetter][2] = c2
           readLetterTemp(array: titles, index: titleLetter)
        } else if editLink == true {
            link[linkChar][2] = c2
            readLetterTemp(array: link, index: linkChar)
        } else if editDesc == true {
            letters[letter][2] = c2
            readLetterTemp(array: letters, index: letter)
        }
        
    }
    
    @IBAction func btn3(_ sender: Any) {
        let path = Bundle.main.path(forResource: "keyboard", ofType:"mp3")
        let url = URL(fileURLWithPath: path!)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
            // couldn't load file :(
        }
        c3 = 1
       if editTitle == true {
          titles[titleLetter][3] = c3
          readLetterTemp(array: titles, index: titleLetter)
       } else if editLink == true {
           link[linkChar][3] = c3
           readLetterTemp(array: link, index: linkChar)
       } else if editDesc == true {
           letters[letter][3] = c3
           readLetterTemp(array: letters, index: letter)
       }
       

    }
    
    @IBAction func btn4(_ sender: Any) {
        let path = Bundle.main.path(forResource: "keyboard", ofType:"mp3")
        let url = URL(fileURLWithPath: path!)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
            // couldn't load file :(
        }
        c4 = 1
        if editTitle == true {
           titles[titleLetter][4] = c4
           readLetterTemp(array: titles, index: titleLetter)
        } else if editLink == true {
            link[linkChar][4] = c4
            readLetterTemp(array: link, index: linkChar)
        } else if editDesc == true {
            letters[letter][4] = c4
            readLetterTemp(array: letters, index: letter)
        }

    }
    
    @IBAction func btn5(_ sender: Any) {
        let path = Bundle.main.path(forResource: "keyboard", ofType:"mp3")
        let url = URL(fileURLWithPath: path!)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
            // couldn't load file :(
        }
        c5 = 1
        if editTitle == true {
           titles[titleLetter][5] = c5
           readLetterTemp(array: titles, index: titleLetter)
        } else if editLink == true {
            link[linkChar][5] = c5
            readLetterTemp(array: link, index: linkChar)
        } else if editDesc == true {
            letters[letter][5] = c5
            readLetterTemp(array: letters, index: letter)
        }

    }
    
    @objc func tapGesture () {
        let path = Bundle.main.path(forResource: "keyboard", ofType:"mp3")
        let url = URL(fileURLWithPath: path!)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
            // couldn't load file :(
        }
        c6 = 1
        if editTitle == true {
           titles[titleLetter][6] = c6
           readLetterTemp(array: titles, index: titleLetter)
        } else if editLink == true {
            link[linkChar][6] = c6
            readLetterTemp(array: link, index: linkChar)
        } else if editDesc == true {
            letters[letter][6] = c6
            readLetterTemp(array: letters, index: letter)
        }
    }

    func grabAuthor () {
        let ref = Database.database().reference().child("users").child("profile")
        let userID = Auth.auth().currentUser?.uid
        print(userID!)
        ref.child(userID!).observe(.value, with: { (snapshot) in
          // Get user value
          if let value = snapshot.value as? NSDictionary,
          let uid = value["uid"] as? String,
          let username = value["username"] as? String,
          let photoURL = value["photoURL"] as? String,
         let url = URL(string: photoURL)
            {
          let Author = UserProfile(uid: uid, username: username, profileImage: url)
               print("From Database:\(Author)")
            }
          
          // ...
          }) { (error) in
            print(error.localizedDescription)
        }


    }
    
    @IBOutlet weak var nonvalidLink: UILabel!
    let databaseRef = Database.database().reference()
    var postCount = 0
    @IBAction func handlePostBtn(_ sender: UIBarButtonItem) {
        if  verifyUrl(urlString: linkField?.text) == false {
            nonvalidLink.isHidden = false
            let utterance = AVSpeechUtterance(string: "Link is not valid, make sure you included h t t p s colon slash slash")
            synthesizer.speak(utterance)
            
        } else {
            guard let userProfile = userService.currentUserProfile else {return}
            let postRef = Database.database().reference().child("posts").childByAutoId()
            
            let postObject = [
                
                "author" : [
                    "uid" : userProfile.uid,
                    "username" : userProfile.username,
                    "photoURL" : userProfile.profileImage.absoluteString
                ],
            
                "title" : titleField.text as Any,
                "link" : linkField.text as Any,
                "description" : descriptionField.text,
                "timeStamp" : [".sv" : "timestamp"]
                
            ] as [String: Any]
            postRef.setValue(postObject, withCompletionBlock: { error, ref in
                if error == nil {
                    self.performSegue(withIdentifier: "toFeed", sender: self)
                    print("dismiss!")
                    
                } else {
                    //handle the error
                }
            })
        }
        
    }
    func newLetter (array: [[Int]], index: Int) {
        print(array)
        c1 = 0
        c2 = 0
        c3 = 0
        c4 = 0
        c5 = 0
        c6 = 0
    }
    func verifyUrl (urlString: String?) -> Bool {
        if let urlString = urlString {
            if let url = NSURL(string: urlString) {
                return UIApplication.shared.canOpenURL(url as URL)
            }
        }
        return false
    }
    @IBAction func nextBtn(_ sender: UIButton) {
        let utterance = AVSpeechUtterance(string: "Next")
        synthesizer.speak(utterance)
        if editTitle == true {
          print("title")
          readLetter(array: titles, index: titleLetter)
          titleLetter += 1
          titles.append([titleLetter,0,0,0,0,0,0])
          newLetter(array: titles, index: titleLetter)
        } else if editLink == true {
           print("link")
           readLetter(array: link, index: linkChar)
           linkChar += 1
           link.append([linkChar,0,0,0,0,0,0])
           newLetter(array: link, index: linkChar)
        } else if editDesc == true {
           print("description")
           readLetter(array: letters, index: letter)
           letter += 1
           letters.append([letter,0,0,0,0,0,0])
           newLetter(array: letters, index: letter)
           
        }
    
    }
    func readLetter(array: [[Int]], index: Int) {
            for term in 0...36{
                let array1 = [index, library.list[term].Circle1, library.list[term].Circle2, library.list[term].Circle3, library.list[term].Circle4, library.list[term].Circle5, library.list[term].Circle6]
                    if array[index] == array1 {
                        word += String(library.list[term].letter)
                        if array == titles {
                          titleString += String(library.list[term].letter)
                          titleField?.text = titleString
                          wordRead(array: titles, index: titleLetter)
                        } else if array == link {
                          linkString += String(library.list[term].letter)
                          linkField?.text = linkString
                          wordRead(array: link, index: linkChar)
                        } else if array == letters {
                           descString += String(library.list[term].letter)
                           descriptionField?.text = descString
                           wordRead(array: letters, index: letter)
                        }
                        
                    }
            }
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
