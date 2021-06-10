//
//  brailleAlphabet.swift
//  dyzAR
//
//  Created by Aashika Jagadeesh on 4/25/20.
//  Copyright © 2020 Aashika Jagadeesh. All rights reserved.
//

import Foundation
class Alphabet {
    let letter: Character
    let capitalLetter: Int
    let Circle1: Int
    let Circle2: Int
    let Circle3: Int
    let Circle4: Int
    let Circle5: Int
    let Circle6: Int
    init (Character: Character, sixth0: Int, first: Int, second: Int, third: Int, fourth: Int, fifth: Int, sixth: Int){
        letter = Character
        capitalLetter = sixth0
        Circle1 = first
        Circle2 = second
        Circle3 = third
        Circle4 = fourth
        Circle5 = fifth
        Circle6 = sixth
    }
    
}


