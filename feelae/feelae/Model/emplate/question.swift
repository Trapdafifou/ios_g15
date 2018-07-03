//
//  question.swift
//  feelae
//
//  Created by victor billard-madrieres on 03/07/2018.
//  Copyright © 2018 Thibaut Marsal. All rights reserved.
//

import Foundation

class question : NSObject{
    
    var question: String
    var answers: [String]
    
    init( question: String, answers: [String]) {
        self.question = question
        self.answers = answers
    }
    
    func getQuestion() -> String {
        return question
    }
    
    func getQuestion() -> [String] {
        return answers
    }
}
