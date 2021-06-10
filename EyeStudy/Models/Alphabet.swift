//
//  Alphabet.swift
//  dyzAR
//
//  Created by Aashika Jagadeesh on 4/25/20.
//  Copyright © 2020 Aashika Jagadeesh. All rights reserved.
//

import Foundation
class brailleAlphabet {
    var list = [Alphabet]()
    init() {
        list.append(Alphabet(Character: "a", sixth0: 0,first: 1, second: 0, third: 0, fourth: 0, fifth: 0, sixth: 0))
        list.append(Alphabet(Character: "b", sixth0: 0, first: 1, second: 1, third: 0, fourth: 0, fifth: 0, sixth: 0))
        list.append(Alphabet(Character: "c", sixth0: 0, first: 1, second: 0, third: 0, fourth: 1, fifth: 0, sixth: 0))
        list.append(Alphabet(Character: "d", sixth0: 0, first: 1, second: 0, third: 0, fourth: 1, fifth: 1, sixth: 0))
        list.append(Alphabet(Character: "e", sixth0: 0, first: 1, second: 0, third: 0, fourth: 0, fifth: 1, sixth: 0))
        list.append(Alphabet(Character: "f", sixth0: 0, first: 1, second: 1, third: 0, fourth: 1, fifth: 0, sixth: 0))
        list.append(Alphabet(Character: "g", sixth0: 0,first: 1, second: 1, third: 0, fourth: 1, fifth: 1, sixth: 0))
        list.append(Alphabet(Character: "h", sixth0: 0, first: 1, second: 1, third: 0, fourth: 0, fifth: 1, sixth: 0))
        list.append(Alphabet(Character: "i", sixth0: 0, first: 0, second: 1, third: 0, fourth: 1, fifth: 0, sixth: 0))
        list.append(Alphabet(Character: "j", sixth0: 0, first: 0, second: 1, third: 0, fourth: 1, fifth: 1, sixth: 0))
        list.append(Alphabet(Character: "k", sixth0: 0, first: 1, second: 0, third: 1, fourth: 0, fifth: 0, sixth: 0))
        list.append(Alphabet(Character: "l", sixth0: 0, first: 1, second: 1, third: 1, fourth: 0, fifth: 0, sixth: 0))
        list.append(Alphabet(Character: "m", sixth0: 0, first: 1, second: 0, third: 1, fourth: 1, fifth: 0, sixth: 0))
        list.append(Alphabet(Character: "n", sixth0: 0, first: 1, second: 0, third: 1, fourth: 1, fifth: 1, sixth: 0))
        list.append(Alphabet(Character: "o", sixth0: 0, first: 1, second: 0, third: 1, fourth: 0, fifth: 1, sixth: 0))
        list.append(Alphabet(Character: "p", sixth0: 0, first: 1, second: 1, third: 1, fourth: 1, fifth: 0, sixth: 0))
        list.append(Alphabet(Character: "q", sixth0: 0, first: 1, second: 1, third: 1, fourth: 1, fifth: 1, sixth: 0))
        list.append(Alphabet(Character: "r", sixth0: 0, first: 1, second: 1, third: 1, fourth: 0, fifth: 1, sixth: 0))
        list.append(Alphabet(Character: "s", sixth0: 0, first: 0, second: 1, third: 1, fourth: 1, fifth: 0, sixth: 0))
        list.append(Alphabet(Character: "t", sixth0: 0, first: 0, second: 1, third: 1, fourth: 1, fifth: 1, sixth: 0))
        list.append(Alphabet(Character: "u", sixth0: 0, first: 1, second: 0, third: 1, fourth: 0, fifth: 0, sixth: 1))
        list.append(Alphabet(Character: "v", sixth0: 0, first: 1, second: 1, third: 1, fourth: 0, fifth: 0, sixth: 1))
        list.append(Alphabet(Character: "w", sixth0: 0, first: 0, second: 1, third: 0, fourth: 1, fifth: 1, sixth: 1))
        list.append(Alphabet(Character: "x", sixth0: 0, first: 1, second: 0, third: 1, fourth: 1, fifth: 0, sixth: 1))
        list.append(Alphabet(Character: "y", sixth0: 0, first: 1, second: 0, third: 1, fourth: 1, fifth: 1, sixth: 1))
        list.append(Alphabet(Character: "z", sixth0: 0, first: 1, second: 0, third: 1, fourth: 0, fifth: 1, sixth: 1))
        list.append(Alphabet(Character: " ", sixth0: 0, first: 0, second: 0, third: 0, fourth: 0, fifth: 0, sixth: 0))
        list.append(Alphabet(Character: ".", sixth0: 0, first: 0, second: 1, third: 0, fourth: 0, fifth: 1, sixth: 1))
        list.append(Alphabet(Character: ",", sixth0: 0, first: 0, second: 1, third: 0, fourth: 0, fifth: 0, sixth: 0))
        list.append(Alphabet(Character: "!", sixth0: 0, first: 0, second: 1, third: 1, fourth: 0, fifth: 1, sixth: 0))
        list.append(Alphabet(Character: "?", sixth0: 0, first: 0, second: 1, third: 1, fourth: 0, fifth: 0, sixth: 1))
        list.append(Alphabet(Character: "-", sixth0: 0, first: 0, second: 0, third: 0, fourth: 0, fifth: 1, sixth: 1))
        list.append(Alphabet(Character: "(", sixth0: 0, first: 0, second: 1, third: 1, fourth: 0, fifth: 1, sixth: 1))
        list.append(Alphabet(Character: ")", sixth0: 0, first: 0, second: 1, third: 1, fourth: 0, fifth: 1, sixth: 1))
        list.append(Alphabet(Character: "<", sixth0: 0, first: 1, second: 1, third: 0, fourth: 0, fifth: 0, sixth: 1))
        list.append(Alphabet(Character: ">", sixth0: 0, first: 0, second: 0, third: 1, fourth: 1, fifth: 1, sixth: 0))
        list.append(Alphabet(Character: "/", sixth0: 0, first: 0, second: 0, third: 1, fourth: 0, fifth: 0, sixth: 0))
        list.append(Alphabet(Character: "'", sixth0: 0, first: 0, second: 0, third: 1, fourth: 0, fifth: 0, sixth: 0))
        list.append(Alphabet(Character: "A", sixth0: 1,first: 1, second: 0, third: 0, fourth: 0, fifth: 0, sixth: 0))
        list.append(Alphabet(Character: "B", sixth0: 1, first: 1, second: 1, third: 0, fourth: 0, fifth: 0, sixth: 0))
        list.append(Alphabet(Character: "C", sixth0: 1, first: 1, second: 0, third: 0, fourth: 1, fifth: 0, sixth: 0))
        list.append(Alphabet(Character: "D", sixth0: 1, first: 1, second: 0, third: 0, fourth: 1, fifth: 1, sixth: 0))
        list.append(Alphabet(Character: "E", sixth0: 1, first: 1, second: 0, third: 0, fourth: 0, fifth: 1, sixth: 0))
        list.append(Alphabet(Character: "F", sixth0: 1, first: 1, second: 1, third: 0, fourth: 1, fifth: 0, sixth: 0))
        list.append(Alphabet(Character: "G", sixth0: 1,first: 1, second: 1, third: 0, fourth: 1, fifth: 1, sixth: 0))
        list.append(Alphabet(Character: "H", sixth0: 1, first: 1, second: 1, third: 0, fourth: 0, fifth: 1, sixth: 0))
        list.append(Alphabet(Character: "I", sixth0: 1, first: 0, second: 1, third: 0, fourth: 1, fifth: 0, sixth: 0))
        list.append(Alphabet(Character: "J", sixth0: 1, first: 0, second: 1, third: 0, fourth: 1, fifth: 1, sixth: 0))
        list.append(Alphabet(Character: "K", sixth0: 1, first: 1, second: 0, third: 1, fourth: 0, fifth: 0, sixth: 0))
        list.append(Alphabet(Character: "L", sixth0: 1, first: 1, second: 1, third: 1, fourth: 0, fifth: 0, sixth: 0))
        list.append(Alphabet(Character: "M", sixth0: 1, first: 1, second: 0, third: 1, fourth: 1, fifth: 0, sixth: 0))
        list.append(Alphabet(Character: "N", sixth0: 1, first: 1, second: 0, third: 1, fourth: 1, fifth: 1, sixth: 0))
        list.append(Alphabet(Character: "O", sixth0: 1, first: 1, second: 0, third: 1, fourth: 0, fifth: 1, sixth: 0))
        list.append(Alphabet(Character: "P", sixth0: 1, first: 1, second: 1, third: 1, fourth: 1, fifth: 0, sixth: 0))
        list.append(Alphabet(Character: "Q", sixth0: 1, first: 1, second: 1, third: 1, fourth: 1, fifth: 1, sixth: 0))
        list.append(Alphabet(Character: "R", sixth0: 1, first: 1, second: 1, third: 1, fourth: 0, fifth: 1, sixth: 0))
        list.append(Alphabet(Character: "S", sixth0: 1, first: 0, second: 1, third: 1, fourth: 1, fifth: 0, sixth: 0))
        list.append(Alphabet(Character: "T", sixth0: 1, first: 0, second: 1, third: 1, fourth: 1, fifth: 1, sixth: 0))
        list.append(Alphabet(Character: "U", sixth0: 1, first: 1, second: 0, third: 1, fourth: 0, fifth: 0, sixth: 1))
        list.append(Alphabet(Character: "V", sixth0: 1, first: 1, second: 1, third: 1, fourth: 0, fifth: 0, sixth: 1))
        list.append(Alphabet(Character: "W", sixth0: 1, first: 0, second: 1, third: 0, fourth: 1, fifth: 1, sixth: 1))
        list.append(Alphabet(Character: "X", sixth0: 1, first: 1, second: 0, third: 1, fourth: 1, fifth: 0, sixth: 1))
        list.append(Alphabet(Character: "Y", sixth0: 1, first: 1, second: 0, third: 1, fourth: 1, fifth: 1, sixth: 1))
        list.append(Alphabet(Character: "Z", sixth0: 1, first: 1, second: 0, third: 1, fourth: 0, fifth: 1, sixth: 1))
    }
}

