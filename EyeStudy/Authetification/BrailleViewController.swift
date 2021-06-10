//
//  BrailleViewController.swift
//  dyzAR
//
//  Created by Aashika Jagadeesh on 4/24/20.
//  Copyright © 2020 Aashika Jagadeesh. All rights reserved.
//

import UIKit
import AVFoundation
class BrailleViewController: UIViewController {
  let synthesizer = AVSpeechSynthesizer()

    @IBOutlet weak var circle1: UIButton!
    
    @IBOutlet weak var circle2: UIButton!
    
    @IBOutlet weak var circle3: UIButton!
    
    @IBOutlet weak var circle4: UIButton!
    
    @IBOutlet weak var circle5: UIButton!
    
    @IBOutlet weak var circle6: UIButton!
    
    @IBOutlet weak var text: UILabel!
    
    @IBOutlet weak var letterLabel: UIButton!
    
   
   
    
    
  
    var audioPlayer: AVAudioPlayer?
    var textView1 = String()
    
    
    var currentColor1: UIColor!
    var currentColor2: UIColor!
    var currentColor3: UIColor!
    var currentColor4: UIColor!
    var currentColor5: UIColor!
    var currentColor6: UIColor!

    override func viewDidLoad() {
        super.viewDidLoad()
circle1.layer.cornerRadius = circle1.frame.size.width/2
circle2.layer.cornerRadius = circle2.frame.size.width/2
circle3.layer.cornerRadius = circle3.frame.size.width/2
circle4.layer.cornerRadius = circle4.frame.size.width/2
circle5.layer.cornerRadius = circle5.frame.size.width/2
circle6.layer.cornerRadius = circle6.frame.size.width/2
text.text = "Hi"

//capitalAction()
capitalLetters()
action()

        // Do any additional setup after loading the view.
    }
    
    var alphabet = brailleAlphabet()
    
    func changeBackground(matchingChar: Character, value: Int) {
        if alphabet.list[value].Circle1 == 1{
            circle1.backgroundColor = .black
        }
    }
    func changeBackground1(matchingChar: Character, value: Int){
       if alphabet.list[value].Circle2 == 1 {
            circle2.backgroundColor = .black
        }
    }
    func changeBackground2(matchingChar: Character, value: Int){
        if alphabet.list[value].Circle3 == 1 {
            circle3.backgroundColor = .black
        }
    }
    func changeBackground3(matchingChar: Character, value: Int) {
        if alphabet.list[value].Circle4 == 1 {
            circle4.backgroundColor = .black
        }
    }
    func changeBackground4(matchingChar: Character, value: Int){
        if alphabet.list[value].Circle5 == 1 {
            circle5.backgroundColor = .black
        }
    }
    func changeBackground5(matchingChar: Character, value: Int) {
        if alphabet.list[value].Circle6 == 1 {
            circle6.backgroundColor = .black
        }
    }
    func capitalLetters() {
        DispatchQueue.global(qos: .default).async {
            for char in (self.text?.text)! {
                DispatchQueue.main.async {
                    for term in 37...62 {
                        if self.alphabet.list[term].letter == char {
                            self.restart()
                            self.circle6.backgroundColor = .black
                            
                        }
                    }
                }
                sleep(3)
            }
        }
    }
    @objc func action() {
            DispatchQueue.global(qos: .default).async {
                for char in (self.text?.text)! {
                DispatchQueue.main.async {
                self.restart()
                for term in 0...62 {
                    if self.alphabet.list[term].letter == char {
                        if self.alphabet.list[term].letter == " " {
                            //play sound
                            let path = Bundle.main.path(forResource: "keyboard", ofType:"mp3")
                            let url = URL(fileURLWithPath: path!)
                            
                            do {
                                self.audioPlayer = try AVAudioPlayer(contentsOf: url)
                                self.audioPlayer?.prepareToPlay()
                                self.audioPlayer?.play()
                            } catch {
                                // couldn't load file :(
                            }
                        }
                        print(self.alphabet.list[term].letter)
                        self.changeBackground(matchingChar: self.alphabet.list[term].letter, value: term)
                        self.changeBackground1(matchingChar: self.alphabet.list[term].letter, value: term)
                        self.changeBackground2(matchingChar: self.alphabet.list[term].letter, value: term)
                        self.changeBackground3(matchingChar: self.alphabet.list[term].letter, value: term)
                        self.changeBackground4(matchingChar: self.alphabet.list[term].letter, value: term)
                        self.changeBackground5(matchingChar: self.alphabet.list[term].letter, value: term)
                    }
                    }
                }
                sleep(3)
                }
        }
    }

    @objc func restart () {
            self.circle1.backgroundColor = .white
            self.circle2.backgroundColor = .white
            self.circle3.backgroundColor = .white
            self.circle4.backgroundColor = .white
            self.circle5.backgroundColor = .white
            self.circle6.backgroundColor = .white
        }
    
   
    
  
 
    
    @IBAction func circle1Swiped(_ sender: Any) {
        if circle1.backgroundColor == .black {
            let path = Bundle.main.path(forResource: "0244", ofType:"wav")
            let url = URL(fileURLWithPath: path!)
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.prepareToPlay()
                audioPlayer?.play()
            } catch {
                // couldn't load file :(
            }
        }
    }
    
    @IBAction func circle2Swiped(_ sender: Any) {
        if circle2.backgroundColor == .black {
            let path = Bundle.main.path(forResource: "0244", ofType:"wav")
            let url = URL(fileURLWithPath: path!)
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.prepareToPlay()
                audioPlayer?.play()
            } catch {
                // couldn't load file :(
            }
        }
    }

 
    @IBAction func circle3Swiped(_ sender: Any) {
        if circle3.backgroundColor == .black {
            let path = Bundle.main.path(forResource: "0244", ofType:"wav")
            let url = URL(fileURLWithPath: path!)
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.prepareToPlay()
                audioPlayer?.play()
            } catch {
                // couldn't load file :(
            }
        }
    }
    
    @IBAction func circle4Swiped(_ sender: Any) {
        if circle4.backgroundColor == .black {
            let path = Bundle.main.path(forResource: "0244", ofType:"wav")
            let url = URL(fileURLWithPath: path!)
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.prepareToPlay()
                audioPlayer?.play()
            } catch {
                // couldn't load file :(
            }
        }
    }
    
    @IBAction func circle5Swiped(_ sender: Any) {
        if circle5.backgroundColor == .black {
            let path = Bundle.main.path(forResource: "0244", ofType:"wav")
            let url = URL(fileURLWithPath: path!)
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.prepareToPlay()
                audioPlayer?.play()
            } catch {
                // couldn't load file :(
            }
        }
    }
    
    @IBAction func circle6Swiped(_ sender: Any) {
        if circle6.backgroundColor == .black {
            let path = Bundle.main.path(forResource: "0244", ofType:"wav")
            let url = URL(fileURLWithPath: path!)
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.prepareToPlay()
                audioPlayer?.play()
            } catch {
                // couldn't load file :(
            }
        }
    }
    
}
