//
//  brailleTyped.swift
//  dyzAR
//
//  Created by Aashika Jagadeesh on 5/7/20.
//  Copyright © 2020 Aashika Jagadeesh. All rights reserved.
//

import Foundation
class brailleTyped {
    var letter: Int
    var c1: Int
    var c2: Int
    var c3: Int
    var c4: Int
    var c5: Int
    var c6: Int
    init (Character: Int, first: Int, second: Int, third: Int, fourth: Int, fifth: Int, sixth: Int){
        letter = Character
        c1 = first
        c2 = second
        c3 = third
        c4 = fourth
        c5 = fifth
        c6 = sixth
    }
}
