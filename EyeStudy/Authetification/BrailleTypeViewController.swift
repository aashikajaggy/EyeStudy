//
//  BrailleTypeViewController.swift
//  Pods-dyzAR
//
//  Created by Aashika Jagadeesh on 5/2/20.
//

import UIKit
import AVFoundation

public class BrailleTypeViewController: UIViewController, UINavigationControllerDelegate {
    
    let synthesizer = AVSpeechSynthesizer()

    @IBOutlet weak var circle1: UIButton!
    
    @IBOutlet weak var circle2: UIButton!
    
    @IBOutlet weak var circle3: UIButton!
    
    @IBOutlet weak var circle4: UIButton!
    
    @IBOutlet weak var circle5: UIButton!
    
    @IBOutlet weak var circle6: UIButton!
    
    @IBOutlet weak var tap1: UIButton!
    
    @IBOutlet weak var tap2: UIButton!
    
    @IBOutlet weak var tap3: UIButton!
    
    @IBOutlet weak var tap4: UIButton!
    
    @IBOutlet weak var tap56: UIButton!
    
    @IBOutlet weak var next2: UIButton!
    
    @IBOutlet weak var bspace: UIButton!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var nextBtnOutlet: UIButton!
    
    @IBOutlet weak var saveTitleLabel: UIButton!
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var noteTextView: UITextView!
    
    var writtenNotes = ""
    var titleNotes = ""
    
    //array initializers
    var letters = [[0,0,0,0,0,0,0]]
    var titles = [[0,0,0,0,0,0,0]]
    var titleLetter = 0
    var indexPath: Int?
    public var completion: ((String, String) -> Void)?
    
    var letter = 0
    var c1: Int = 0
    var c2: Int = 0
    var c3: Int = 0
    var c4: Int = 0
    var c5: Int = 0
    var c6: Int = 0

    
    var audioPlayer: AVAudioPlayer?
    var library = brailleAlphabet()
    
 
    
    //keyboard buttons tapped from 1-6
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
        
        circle1.backgroundColor = .black
        c1 = 1
        if saveTitleLabel?.currentTitle == "Save Title" {
            titles[titleLetter][1] = c1
            readLetter(array: titles, index: titleLetter)
        }
        if saveTitleLabel?.currentTitle == "Change Title" {
            letters[letter][1] = c1
            readLetter(array: letters, index: letter)
        }
        
    }
    
  
    
    @IBAction func btn2(_ sender: Any) {
       circle2.backgroundColor = .black
        let path = Bundle.main.path(forResource: "keyboard", ofType:"mp3")
        let url = URL(fileURLWithPath: path!)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
            // couldn't load file :(
        }
   
       //backspace.action = #selector(backspace2)
        c2 = 1
        if saveTitleLabel?.currentTitle == "Save Title" {
            titles[titleLetter][2] = c2
            readLetter(array: titles, index: titleLetter)
        } else {
            letters[letter][2] = c2
            readLetter(array: letters, index: letter)
        }
    }
    
    @IBAction func btn3(_ sender: UIButton) {
        circle3.backgroundColor = .black
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
        if saveTitleLabel?.currentTitle == "Save Title" {
            titles[titleLetter][3] = c3
            readLetter(array: titles, index: titleLetter)
        } else {
            letters[letter][3] = c3
            readLetter(array: letters, index: letter)
        }
    }
    
  
    @IBAction func btn4(_ sender: Any) {
        circle4.backgroundColor = .black
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
        if saveTitleLabel?.currentTitle == "Save Title" {
            titles[titleLetter][4] = c4
            readLetter(array: titles, index: titleLetter)
        } else {
            letters[letter][4] = c4
            readLetter(array: letters, index: letter)
        }
        //backspace mechanisms
    }
    

    @IBAction func btn5(_ sender: Any) {
        circle5.backgroundColor = .black
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
        if saveTitleLabel?.currentTitle == "Save Title" {
            titles[titleLetter][5] = c5
            readLetter(array: titles, index: titleLetter)
        } else {
            letters[letter][5] = c5
            readLetter(array: letters, index: letter)
        }
    }
    
    @IBAction func clearBtn(_ sender: Any) {
        let utterance = AVSpeechUtterance(string: "clear")
        synthesizer.speak(utterance)
        letters[letter] = [letter, 0,0,0,0,0,0]
        restart()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        circle1.layer.cornerRadius = circle1.frame.size.width/2
        circle2.layer.cornerRadius = circle2.frame.size.width/2
        circle3.layer.cornerRadius = circle3.frame.size.width/2
        circle4.layer.cornerRadius = circle4.frame.size.width/2
        circle5.layer.cornerRadius = circle5.frame.size.width/2
        circle6.layer.cornerRadius = circle6.frame.size.width/2
        
        
        tap1.layer.cornerRadius = circle1.frame.size.width/2
        tap1.layer.borderWidth = 14.0
        tap1.layer.borderColor = UIColor.red.cgColor
        
        
        tap2.layer.cornerRadius = circle2.frame.size.width/2
        tap2.layer.borderWidth = 14.0
        tap2.layer.borderColor = UIColor.red.cgColor
       
        
        tap3.layer.cornerRadius = circle3.frame.size.width/2
        tap3.layer.borderWidth = 14.0
        tap3.layer.borderColor = UIColor.red.cgColor
       
        
        tap4.layer.cornerRadius = circle4.frame.size.width/2
        tap4.layer.borderWidth = 14.0
        tap4.layer.borderColor = UIColor.red.cgColor
        
        
        tap56.layer.cornerRadius = circle5.frame.size.width/2
        tap56.layer.borderWidth = 14.0
        tap56.layer.borderColor = UIColor.red.cgColor
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapGesture))
        tapGesture.numberOfTapsRequired = 2
        tap56.addGestureRecognizer(tapGesture)
        titleTextField.becomeFirstResponder()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSave))
    }
    
   
    
    
    @objc func tapGesture () {
        circle6.backgroundColor = .black
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
        if saveTitleLabel?.currentTitle == "Save Title" {
            titles[titleLetter][6] = c6
            readLetter(array: titles, index: titleLetter)
        } else {
          letters[letter][6] = c6
          readLetter(array: letters, index: letter)
        }
        bspace?.removeTarget(nil, action: nil, for: .allEvents)
        bspace?.addTarget(self, action: #selector(backspace6), for: .touchUpInside)
    }
    @objc func backspace1 () {
        circle1.backgroundColor = .white
        let utterance = AVSpeechUtterance(string: "backspace")
        synthesizer.speak(utterance)
    }
    @objc func backspace2 () {
        circle2.backgroundColor = .white
        let utterance = AVSpeechUtterance(string: "backspace")
        synthesizer.speak(utterance)
    }
    @objc func backspace3 () {
        circle3.backgroundColor = .white
        let utterance = AVSpeechUtterance(string: "backspace")
        synthesizer.speak(utterance)
    }
    @objc func backspace4 () {
        circle4.backgroundColor = .white
        let utterance = AVSpeechUtterance(string: "backspace")
        synthesizer.speak(utterance)
    }
    @objc func backspace5 () {
        circle5.backgroundColor = .white
        let utterance = AVSpeechUtterance(string: "backspace")
        synthesizer.speak(utterance)
    }
    @objc func backspace6 () {
        circle6.backgroundColor = .white
        let utterance = AVSpeechUtterance(string: "backspace")
        synthesizer.speak(utterance)
    }
    func changeBackground(array: [[Int]], index: Int) {
            if array[index-1][1] == 1 {
            circle1.backgroundColor = .black
            }
       
    }
    
    func restart () {
        titleLabel?.text = ""
        self.circle1.backgroundColor = .white
        self.circle2.backgroundColor = .white
        self.circle3.backgroundColor = .white
        self.circle4.backgroundColor = .white
        self.circle5.backgroundColor = .white
        self.circle6.backgroundColor = .white
    }
    func changeBackground1(array: [[Int]], index: Int){
        
            if array[index-1][2] == 1 {
                circle2.backgroundColor = .black
            }
        
    }
    func changeBackground2(array: [[Int]], index: Int){
   
            if array[index-1][3] == 1 {
                circle3.backgroundColor = .black
            }
       
    }
    func changeBackground3(array: [[Int]], index: Int) {
       
            if array[index-1][4] == 1 {
                circle4.backgroundColor = .black
            }
      
    }
    func changeBackground4(array: [[Int]], index: Int){
        
            if array[index-1][5] == 1 {
                circle5.backgroundColor = .black
            }
      
       
    }
    func changeBackground5(array: [[Int]], index: Int) {
        
            if array[index-1][6] == 1 {
                circle6.backgroundColor = .black
            }
       
    }
    var finalLetter = ""
    @IBAction func nextButton(_ sender: UIButton) {
        let utterance = AVSpeechUtterance(string: "Next")
        synthesizer.speak(utterance)
        if saveTitleLabel?.currentTitle == "Save Title" {
            readLetter(array: titles, index: titleLetter)
            wordRead(array: titles, index: titleLetter)
            if (titleLetter) < (titles.count - 1) {
                iterate(array: titles, index: titleLetter)
                titleLetter += 1
            } else {
                titleLetter += 1
                titles.append([titleLetter, 0,0,0,0,0,0])
                newLetter(array: titles, index: titleLetter)
            }
            
        } else {
            readLetter(array: letters, index: letter)
            wordRead(array: letters, index: letter)
           
            if (letter) < (letters.count - 1) {
                iterate(array: letters, index: letter)
                letter += 1
            } else {
                letter += 1
                letters.append([letter, 0,0,0,0,0,0])
                newLetter(array: letters, index: letter)
            }
        }
    }
    var counter = 0
    @IBAction func saveTitle(_ sender: UIButton) {
        //wordRead2()

        if saveTitleLabel.currentTitle == "Save Title" {
            
            let utterance = AVSpeechUtterance(string: "Saved Title")
            synthesizer.speak(utterance)
            saveTitleLabel.setTitle("Change Title", for: .normal)
            readLetter(array: titles, index: titleLetter)
            wordRead(array: titles, index: titleLetter)
            newLetter(array: titles, index: titleLetter)
        } else {
            let utterance = AVSpeechUtterance(string: "Change Title")
            synthesizer.speak(utterance)
            saveTitleLabel?.setTitle("Save Title", for: .normal)
            readLetter(array: letters, index: letter)
            wordRead(array: letters, index: letter)
            newLetter(array: letters, index: letter)
        }
    }
    //converting braille to English using brailleAlphabet array

    func readLetter(array: [[Int]], index: Int) {
            for term in 0...36{
                let array1 = [index, library.list[term].Circle1, library.list[term].Circle2, library.list[term].Circle3, library.list[term].Circle4, library.list[term].Circle5, library.list[term].Circle6]
                    if array[index] == array1 {
                        if array == letters {
                            print("appended to the correct array!!")
                        }
                        titleLabel?.text = String(library.list[term].letter)
                        nextBtnOutlet.addTarget(self, action: #selector(storeLetter), for: .touchUpInside)
                        saveTitleLabel.addTarget(self, action: #selector(storeLetter), for: .touchUpInside)
                        print(library.list[term].letter)
                    }
            }
    }
    //this function saves letters typed in braille to writtenNotes and titleNotes
    @objc func storeLetter () -> String{
       finalLetter = (titleLabel?.text)!
       return finalLetter
    }
    //new letter in text
    public func newLetter (array: [[Int]], index: Int) {
        print(array)
        restart()
        c1 = 0
        c2 = 0
        c3 = 0
        c4 = 0
        c5 = 0
        c6 = 0
    }
    //recognizes words user types
    
    var word = "" //yields title
    var word1 = "" //carrier of words
    var word2 = "" // yields description
    func wordRead (array: [[Int]], index: Int) {
      
       let bird1 = storeLetter()
        word1 += bird1
        if array == titles {
            word += bird1
        } else {
            word2 += bird1
        }
       let bird = changeText1(parameter1: word, parameter2: word2)
       print("title " + bird.0)
       print("description " + bird.1)
        if array[index] == [index,0,0,0,0,0,0] {
            let utterance = AVSpeechUtterance(string: word1)
            synthesizer.speak(utterance)
            changeText()
            
        }
    }
    
    func changeText(){
        if saveTitleLabel.currentTitle == "Save Title" {
            titleNotes += "\(word1)"
            word1 = ""
        } else {
            writtenNotes += "\(word1)"
            word1 = ""
        }
    }
    //testing
    
    func changeText1(parameter1: String, parameter2: String) -> (String, String) {
        
            titleNotes = parameter1
      
            writtenNotes = parameter2
        
        return (titleNotes, writtenNotes)
    }
    //this code reads the word the user just typed in when they press "Save Title"

    @objc func didTapSave() {
        let bird = changeText1(parameter1: word, parameter2: word2)
        titleTextField?.text = bird.0
        print("hello " + bird.0)
        noteTextView?.text = bird.1
        print("hello " + bird.1)
        if let text = titleTextField.text, !text.isEmpty, !noteTextView.text.isEmpty {
            completion?(text, noteTextView.text)
            let utterance = AVSpeechUtterance(string: "Saved Note")
            synthesizer.speak(utterance)
            
        }
    }
    @IBAction func backButton(_ sender: UIButton) {
        let utterance = AVSpeechUtterance(string: "Back")
        synthesizer.speak(utterance)
        if saveTitleLabel?.currentTitle == "Save Title" {
            if titleLetter > 0 {
                restart()
                changeBackground(array: titles, index: titleLetter)
                changeBackground1(array: titles, index: titleLetter)
                changeBackground2(array: titles, index: titleLetter)
                changeBackground3(array: titles, index: titleLetter)
                changeBackground4(array: titles, index: titleLetter)
                changeBackground5(array: titles, index: titleLetter)
                titleLetter = titleLetter - 1
            }
        } else {
            if letter > 0 {
                restart()
                changeBackground(array: letters, index: letter)
                changeBackground1(array: letters, index: letter)
                changeBackground2(array: letters, index: letter)
                changeBackground3(array: letters, index: letter)
                changeBackground4(array: letters, index: letter)
                changeBackground5(array: letters, index: letter)
                letter = letter - 1
            }
        }
    }
  
    func iterate(array: [[Int]], index: Int) {
            restart()
        
             if array[index+1][1] == 1 {
                circle1.backgroundColor = .black
            }
            if array[index+1][2] == 1 {
                circle2.backgroundColor = .black
            }
 
            if array[index+1][3] == 1 {
                circle3.backgroundColor = .black
            }

            if array[index+1][4] == 1 {
                circle4.backgroundColor = .black
            }
      
            if array[index+1][5] == 1 {
                circle5.backgroundColor = .black
            }
      
            if array[index+1][6] == 1 {
                circle6.backgroundColor = .black
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
