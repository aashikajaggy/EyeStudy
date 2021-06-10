//
//  ViewController.swift
//  dyzAR
//
//  Created by Aashika Jagadeesh on 4/16/20.
//  Copyright © 2020 Aashika Jagadeesh. All rights reserved.
//

import UIKit
import SceneKit
//import ARKit
import TesseractOCR
import AVFoundation
import Firebase



class ViewController: UIViewController,
G8TesseractDelegate,
AVSpeechSynthesizerDelegate{
    
    let synthesizer = AVSpeechSynthesizer()
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var keyboard: UIView!
    @IBOutlet weak var keyboard1: UIView!
    @IBOutlet weak var keyboard2: UIView!
    @IBOutlet weak var keyboard3: UIView!
    @IBOutlet weak var keyboard4: UIView!
    @IBOutlet weak var keyboard5: UIView!
    @IBOutlet weak var shadedView: UIView!
    @IBOutlet weak var customLabel: UILabel!
    @IBOutlet weak var connectPic: UIImageView!
    @IBOutlet weak var currentPosition: UILabel!
    var userImg: UIImage!
    
    
    
    
    //audio
    
    
  
    @IBAction func speechButton(_ sender: Any) {
       
            let utterance = AVSpeechUtterance(string: textView.text)
            synthesizer.speak(utterance)

    }
    
    
    //toggle
    @IBAction func toggleSwitch(_ sender: UISwitch) {
/*
        if sender.isOn == true {
            
            Reductio.summarize(text: textView.text, compression: 0.80) { phrases in
                
                textView.text =  "\(phrases)"
               
            }
        }
*/
    }

    
   //sizes
    private let sizesInt = [15, 17, 25, 30]
    
    @IBAction func sizePressed(_ sender: UIButton) {
        for rows in 0...3 {
            if sender.tag == rows {
            textView.font = textView.font?.withSize(CGFloat(sizesInt[rows]))
            }
        }
    }
    var index = 0
    //rotor 1 function
    let fontsArray = ["Pick a font. Helvetica Neue", "Arial", "Verdana", "Trebuchet", "Dyslexic Regular", "Dyslexic Bold", "Dyslexic Italic", "Dyslexic Bold Italic"]
    @objc func handleRotate1(sender: UIRotationGestureRecognizer) {
        if sender.state == .began || sender.state == .changed {
            shadedView.isHidden = false
            customLabel.isHidden = false
            customLabel.text = fontsArray[index]
        } else if sender.state == .ended {
            let utterance1 = AVSpeechUtterance(string: (customLabel?.text)!)
            synthesizer.speak(utterance1)
            if index == fontsArray.count - 1{
                index = 0
            } else {
                index += 1
             }
            if customLabel?.text == "Pick a font. Helvetica Neue" {
                textView.font = UIFont(name: "Helvetica Neue", size: 17)
            } else if customLabel?.text == "Arial"{
                textView.font = UIFont(name: "Arial", size: 17)
            } else if customLabel?.text == "Verdana" {
                textView.font = UIFont(name: "Verdana", size: 17)
            } else if customLabel?.text == "Trebuchet" {
                textView.font = UIFont(name: "Trebuchet", size: 17)
            } else if customLabel?.text == "Dyslexic Regular" {
                textView.font = UIFont(name: "OpenDyslexic-Regular", size: 17)
            } else if customLabel?.text == "Dyslexic Bold" {
                textView.font = UIFont(name: "OpenDyslexic-Bold", size: 17)
            } else if customLabel?.text == "Dyslexic Italic" {
                textView.font = UIFont(name: "OpenDyslexic-Italic", size: 17)
            } else if customLabel?.text == "Dyslexic Bold Italic" {
                textView.font = UIFont(name: "OpenDyslexic-BoldItalic", size: 17)
            }
            clearView()
        }
        sender.rotation = 0
    }
    func clearView () {
        shadedView.isHidden = true
        customLabel.isHidden = true
    }
    //Colors Rotate
   
    var colors = ["Purple", "Yellow", "Green", "Red", "Turquoise", "Blue", "White"]
    @objc func handleRotate2(sender: UIRotationGestureRecognizer) {
        if sender.state == .began || sender.state == .changed {
            shadedView.isHidden = false
            customLabel.isHidden = false
            customLabel.text = colors[index]
        } else if sender.state == .ended {
            let utterance1 = AVSpeechUtterance(string: (customLabel?.text)!)
            synthesizer.speak(utterance1)
            if index == colors.count - 1{
                index = 0
            } else {
                index += 1
             }
            if customLabel?.text == "Purple" {
                let purpleColor = UIColor(red: 150/255.0, green: 0/255.0, blue: 205/255.0, alpha: 1.0)
                changeColor(color: purpleColor)
                
            } else if customLabel?.text == "Yellow" {
                 let yellowColor = UIColor(red: 237/255.0, green: 237/255.0, blue: 4/255.0, alpha: 1.0)
                changeColor(color: yellowColor)
            } else if customLabel?.text == "Green" {
            let greenColor = UIColor(red: 152/255.0, green: 251/255.0, blue: 152/255.0, alpha: 1.0)
                changeColor(color: greenColor)
            } else if customLabel?.text == "Red" {
               let redPink = UIColor(red: 234/255.0, green: 60/255.0, blue: 83/255.0, alpha: 1.0)
                changeColor(color: redPink)
            } else if customLabel?.text == "Turquoise" {
                let turquoiseColor = UIColor(red: 63/255.0, green: 224/255.0, blue: 208/255.0, alpha: 1.0)
                changeColor(color: turquoiseColor)
            } else if customLabel?.text == "Blue" {
                let blueColor = UIColor(red: 14/255.0, green: 77/255.0, blue: 146/255.0, alpha: 1.0)
                changeColor(color: blueColor)
            } else if customLabel?.text == "White" {
                changeColor(color: .white)
            }
            clearView()
        }
    }
    //Sizes
    @objc func handleRotate3 (sender: UIRotationGestureRecognizer) {
         index = 0
        if sender.state == .began || sender.state == .changed {
          shadedView.isHidden = false
          customLabel.isHidden = false
          customLabel.text = String(sizesInt[index])
        } else if sender.state == .ended {
            let utterance1 = AVSpeechUtterance(string: (customLabel?.text)!)
            synthesizer.speak(utterance1)
            if index == sizesInt.count - 1{
                index = 0
            } else {
                index += 1
             }
            if customLabel?.text == "15" {
                textView.font = textView.font?.withSize(CGFloat(15))
            } else if customLabel?.text == "17" {
                textView.font = textView.font?.withSize(CGFloat(17))
            } else if customLabel?.text == "25" {
                textView.font = textView.font?.withSize(CGFloat(25))
            } else if customLabel?.text == "30" {
                textView.font = textView.font?.withSize(CGFloat(30))
            }
            clearView()
        }
    }
    @objc func handleRotate4 (sender: UIRotationGestureRecognizer) {
        if sender.state == .began || sender.state == .changed {
          shadedView.isHidden = false
          customLabel.isHidden = false
          customLabel.text = String(spacing[index])
            
        } else if sender.state == .ended {
          let utterance1 = AVSpeechUtterance(string: (customLabel?.text)!)
          synthesizer.speak(utterance1)
           if index == sizesInt.count - 1{
              index = 0
            } else {
              index += 1
             }
            if customLabel?.text == "1.0" {
                textView.setLineSpacing(lineSpacing: CGFloat(1.0), lineHeightMultiple: CGFloat(1.0))
            } else if customLabel?.text == "1.5" {
                textView.setLineSpacing(lineSpacing: CGFloat(1.5), lineHeightMultiple: CGFloat(1.0))
            } else if customLabel?.text == "2.0" {
                textView.setLineSpacing(lineSpacing: CGFloat(2.0), lineHeightMultiple: CGFloat(1.5))
            } else if customLabel?.text == "2.5" {
                textView.setLineSpacing(lineSpacing: CGFloat(2.5), lineHeightMultiple: CGFloat(2.0))
            }
            clearView()
        }
    }
    var enable = ["Enable Text to Speech", "Disable Text to Speech"]
    @objc func handleRotate5(sender: UIRotationGestureRecognizer) {
        if sender.state == .began || sender.state == .changed {
          shadedView.isHidden = false
          customLabel.isHidden = false
          customLabel.text = enable[index]
            
        } else if sender.state == .ended{
            let utterance1 = AVSpeechUtterance(string: (customLabel?.text)!)
            synthesizer.speak(utterance1)
            if index == sizesInt.count - 1{
              index = 0
            } else {
              index += 1
            }
            if customLabel?.text == "Enable Text to Speech" {
                let utterance1 = AVSpeechUtterance(string: (textView?.text)!)
                synthesizer.speak(utterance1)
            }
            clearView()
        }
    }
    func changeColor(color: UIColor) {
        textView.backgroundColor = color
        view.backgroundColor = color
    }
    //transitions between arrows - NEXT
    
    @IBAction func customizeButton(_ sender: UIBarButtonItem) {
        keyboard.isHidden = !keyboard.isHidden
        let rotate = UIRotationGestureRecognizer(target: self, action: #selector(handleRotate1(sender:)))
              view.addGestureRecognizer(rotate)
    }
    
    @IBAction func nextPressed(_ sender: UIButton) {
        if keyboard.isHidden == false {
            //keyboard.isHidden = true
             keyboard1?.isHidden = false
            let rotate = UIRotationGestureRecognizer(target: self, action: #selector(handleRotate2(sender:)))
            view.addGestureRecognizer(rotate)
        }
        
    }
    

    @IBAction func nextPressed1(_ sender: Any) {
        if keyboard1.isHidden == false {
            //keyboard.isHidden = true
            keyboard2?.isHidden = false
            let rotate = UIRotationGestureRecognizer(target: self, action: #selector(handleRotate3(sender:)))
            view.addGestureRecognizer(rotate)
        }
        
    }
    
    @IBAction func nextPressed2(_ sender: UIButton) {
        if keyboard2?.isHidden == false {
            //keyboard.isHidden = true
            keyboard3?.isHidden = false
            let rotate = UIRotationGestureRecognizer(target: self, action: #selector(handleRotate4(sender:)))
            view.addGestureRecognizer(rotate)
        }
    }
    
    @IBAction func nextPressed3(_ sender: UIButton) {
        if keyboard3?.isHidden == false {
            //keyboard.isHidden = true
            keyboard4?.isHidden = false
            let rotate = UIRotationGestureRecognizer(target: self, action: #selector(handleRotate5(sender:)))
            view.addGestureRecognizer(rotate)
        }
    }
    
    @IBAction func nextPressed4(_ sender: UIButton) {
        if keyboard4?.isHidden == false {
            keyboard5?.isHidden = false
        }
    }
    
    //Previous - Transition Between Arrows

    


    @IBAction func previousPressed1(_ sender: UIButton) {
        
        if keyboard1.isHidden == false {
            keyboard1.isHidden = !keyboard.isHidden
        }
    }
    

    @IBAction func previousPressed2(_ sender: UIButton) {
        if keyboard2.isHidden == false {
            keyboard2.isHidden = !keyboard1.isHidden
        }
    }
    
    @IBAction func previousPressed3(_ sender: UIButton) {
        if keyboard3.isHidden == false {
            keyboard3.isHidden = !keyboard2.isHidden
        }
    }
    
    @IBAction func previousPressed4(_ sender: Any) {
        if keyboard4.isHidden == false {
            keyboard4.isHidden = !keyboard3.isHidden
    
        }
    }

    @IBAction func previousPressed5(_ sender: UIButton) {
        if keyboard5.isHidden == false {
            keyboard5.isHidden = !keyboard5.isHidden
        }
    }
    @IBAction func exit1(_ sender: UIButton) {
        keyboard.isHidden = true
    }

    @IBAction func exit2(_ sender: UIButton) {
        keyboard1.isHidden = true
        keyboard.isHidden = true
    }

    @IBAction func exit3(_ sender: UIButton) {
        keyboard2.isHidden = true
        keyboard.isHidden = true
    }

    @IBAction func exit4(_ sender: UIButton) {
        keyboard3.isHidden = true
        keyboard.isHidden = true
    }
    @IBAction func exit5(_ sender: UIButton) {
        keyboard4.isHidden = true
        keyboard.isHidden = true
    }

    @IBAction func exit6(_ sender: UIButton) {
        keyboard5.isHidden = true
        keyboard.isHidden = true 
    }
    
    
//Colors

    @IBAction func purple(_ sender: Any) {
        let purpleColor = UIColor(red: 210/255.0, green: 210/255.0, blue: 255/255.0, alpha: 1.0)
        textView.backgroundColor = purpleColor
        view.backgroundColor = purpleColor
    }
    @IBAction func yellow(_ sender: Any) {
        let yellowColor = UIColor(red: 251/255.0, green: 255/255.0, blue: 208/255.0, alpha: 1.0)
        textView.backgroundColor = yellowColor
        view.backgroundColor = yellowColor
    }
    @IBAction func green(_ sender: UIButton) {
        
        let yellowColor = UIColor(red: 255/255.0, green: 160/255.0, blue: 174/255.0, alpha: 1.0)
        textView.backgroundColor = yellowColor
        view.backgroundColor = yellowColor
    }
    @IBAction func redPink(_ sender: Any) {
        let redPink = UIColor(red: 130/255.0, green: 239/255.0, blue: 255/255.0, alpha: 1.0)
        textView.backgroundColor = redPink
        view.backgroundColor = redPink
    }

    @IBAction func turquoise(_ sender: Any) {
        let turquoiseColor = UIColor(red: 151/255.0, green: 183/255.0, blue: 255/255.0, alpha: 1.0)
        textView.backgroundColor = turquoiseColor
        view.backgroundColor = turquoiseColor
    }

    @IBAction func blue(_ sender: UIButton) {
        let blueColor = UIColor(red: 217/255.0, green: 255/255.0, blue: 207/255.0, alpha: 1.0)
        textView.backgroundColor = blueColor
        view.backgroundColor = blueColor
    }

    @IBAction func white(_ sender: UIButton) {
        textView.backgroundColor = .white
        view.backgroundColor = .white 
    }
    

    //Fonts

    @IBAction func Helvetica(_ sender: UIButton) {
      textView.font = UIFont(name: "Helvetica Neue", size: 17)
    }

    @IBAction func Arial(_ sender: UIButton) {
      textView.font = UIFont(name: "Arial", size: 17)
    }
    @IBAction func verdana(_ sender: UIButton) {
        textView.font = UIFont(name: "Verdana", size: 17)
    }

    @IBAction func Trebuchet(_ sender: UIButton) {
         textView.font = UIFont(name: "Trebuchet MS", size: 17)
    }

    @IBAction func BoerReg(_ sender: Any) {
         textView.font = UIFont(name: "OpenDyslexic-Regular", size: 17)
    }
    
    @IBAction func boerBold(_ sender: UIButton) {
textView.font = UIFont(name: "OpenDyslexic-Bold", size: 17)
    }
    @IBAction func boerItalic(_ sender: UIButton) {
              textView.font = UIFont(name: "OpenDyslexic-Italic", size: 17)
    }

    @IBAction func boerBoldItalic(_ sender: Any) {
         textView.font = UIFont(name: "OpenDyslexic-BoldItalic", size: 17)
    }
    
   //Spacing!!
    let spacing = [1.0, 1.5, 2.0, 2.5]
    let heightMult = [0.5, 1.0, 1.5, 2.0]
    
    @IBAction func spacing1(_ sender: UIButton) {
        for space in 0...3 {
            if sender.tag == space {
            textView.setLineSpacing(lineSpacing: CGFloat(spacing[space]), lineHeightMultiple: CGFloat(heightMult[space]))
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "brailleSegue" {
            let dvc = segue.destination as! BrailleViewController
            dvc.textView1 = textView.text!
        }
    }
 
//letter spacing
    var counter = 1
    @objc func whenSwipedRight () {
         
        counter += 1
        print("swipe registered")
        if counter == 2 {
            revealView(labelText: "Background Color")
            currentPosition?.text = "2"
            let rotate = UIRotationGestureRecognizer(target: self, action: #selector(handleRotate2(sender:)))
            view.addGestureRecognizer(rotate)
            
        } else if counter == 3 {
            revealView(labelText: "Sizes")
            currentPosition?.text = "3"
            let rotate = UIRotationGestureRecognizer(target: self, action: #selector(handleRotate3(sender:)))
            view.addGestureRecognizer(rotate)
        } else if counter == 4 {
            revealView(labelText: "Line Spacing")
            currentPosition?.text = "4"
            let rotate = UIRotationGestureRecognizer(target: self, action: #selector(handleRotate4(sender:)))
            view.addGestureRecognizer(rotate)
        } else if counter == 5 {
            revealView(labelText: "Audio")
            currentPosition?.text = "5"
            let rotate = UIRotationGestureRecognizer(target: self, action: #selector(handleRotate5(sender:)))
            view.addGestureRecognizer(rotate)
        }
       counterGreater()
    }

    var backCounter = 0
    
    @objc func whenSwipedLeft () {
        counter = Int((currentPosition?.text)!) ?? 0
        print((currentPosition?.text)! + " back swipe registered")
        if counter == 2 {
          counter = 1
          revealView(labelText: "Fonts")
          let rotate = UIRotationGestureRecognizer(target: self, action: #selector(handleRotate1(sender:)))
          view.addGestureRecognizer(rotate)
        } else if counter == 3 {
          counter = 2
          revealView(labelText: "Background Color")
          let rotate = UIRotationGestureRecognizer(target: self, action: #selector(handleRotate2(sender:)))
          view.addGestureRecognizer(rotate)
        } else if counter == 4 {
           counter = 3
           revealView(labelText: "Sizes")
           let rotate = UIRotationGestureRecognizer(target: self, action: #selector(handleRotate3(sender:)))
           view.addGestureRecognizer(rotate)
        } else if counter == 5 {
            counter = 4
            revealView(labelText: "Line Spacing")
            let rotate = UIRotationGestureRecognizer(target: self, action: #selector(handleRotate4(sender:)))
            view.addGestureRecognizer(rotate)
        }
    }

    //checking to see counter exceeds number of rotors
    func counterGreater () {
        if counter == 5 {
            counter = 1
        }
    }
    func revealView (labelText: String) {  //aiding user with swipe gesture recognizers
       let utterance = AVSpeechUtterance(string: labelText + ". Rotate fingers to see more options")
        synthesizer.speak(utterance)
    
    }
    //Tesseract
    var ref: DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
        connectPic.image = userImg
        
        if let tesseract = G8Tesseract(language: "eng"){
            tesseract.delegate = self
            tesseract.image = UIImage(named: "ClearText.jpg")
            //tesseract.image = connectPic?.image
            tesseract.recognize()
            textView?.text = tesseract.recognizedText
            
      

        

        
        // Set the view's delegate
        //sceneView?.delegate = self
        
        // Show statistics such as fps and timing information
        //sceneView?.showsStatistics = true
        
        // Create a new scene
        //let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
        // Set the scene to the view
       // sceneView?.scene = scene
        ref = Database.database().reference()
    
    /*
       ref.child("posts").observe(.value, with: { (snapshot) in
       if let id = snapshot.value as? [String : Any]  {
         //print("The value from the database: \(id)”)
         print("The value from the database: \(id)")
       }
       })
     */
        
    }


        let rotate = UIRotationGestureRecognizer(target: self, action: #selector(handleRotate1(sender:)))
        view.addGestureRecognizer(rotate)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(whenSwipedRight))
        swipeRight.direction = .left
        view.addGestureRecognizer(swipeRight)
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(whenSwipedLeft))
        leftSwipe.direction = .right
        view.addGestureRecognizer(leftSwipe)
        
        func progressImageRecognition(for tesseract: G8Tesseract!) {
            print("Recognition Progress \(tesseract.progress) %")
        }
        
        
        func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        //let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        //sceneView.session.run(configuration)
    }
    
        func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        //sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    /*
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
   */
}
    
}
/*extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sizes.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textView.font = textView.font?.withSize(CGFloat(sizesInt[row]))
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sizes[row]
    }
}
*/
extension UITextView {
    
    // Pass value for any one of both parameters and see result
    func setLineSpacing(lineSpacing: CGFloat = 0.0, lineHeightMultiple: CGFloat = 0.0) {
        
        guard let labelText = self.text else { return }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.lineHeightMultiple = lineHeightMultiple
        
        let attributedString:NSMutableAttributedString
        if let labelattributedText = self.attributedText {
            attributedString = NSMutableAttributedString(attributedString: labelattributedText)
        } else {
            attributedString = NSMutableAttributedString(string: labelText)
        }
        
        // Line spacing attribute
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        
        self.attributedText = attributedString
    }
}
extension UITextView {
    func addCharacterSpacing(_ kernValue: Double = 1.30) {
        guard let attributedString: NSMutableAttributedString = {
            if let text = self.text, !text.isEmpty {
                return NSMutableAttributedString(string: text)
            } else if let attributedText = self.attributedText {
                return NSMutableAttributedString(attributedString: attributedText)
            }
            return nil
            }() else { return}
        
        attributedString.addAttribute(
            NSAttributedString.Key.kern,
            value: kernValue,
            range: NSRange(location: 0, length: attributedString.length)
        )
        self.attributedText = attributedString
    }
}

