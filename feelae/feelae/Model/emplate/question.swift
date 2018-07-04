//
//  question.swift
//  feelae
//
//  Created by victor billard-madrieres on 03/07/2018.
//  Copyright © 2018 Thibaut Marsal. All rights reserved.
//

import Foundation

class question : NSObject{
    
    var id: String
    var question: String?
    var response: [question]?
    var pageType: String
    var conclusion: String?
    
    init( id: String, question: String, pageType: String, response: [question]?, conclusion: String?) {
        self.question = question
        self.id = id
        self.pageType = pageType
        self.response = response
        self.conclusion = conclusion
    }
    
    func getQuestion() -> String? {
        return question
    }
    
    func getPageType() -> String {
        return pageType
    }
    
    func getResponse() -> [question]? {
        return response
    }
    
    func getConclusion() -> String? {
        return conclusion
    }
    
    func getId() -> String {
        return id
    }
}
