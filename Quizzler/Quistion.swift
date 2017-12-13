//
//  Quistion.swift
//  Quizzler
//
//  Created by Hazem on 12/13/17.
//  Copyright © 2017 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    
    let questionText : String
    let answer : Bool
    
    init(text:String, correctAnswer:Bool) {
        questionText = text
        answer = correctAnswer
    }
}
