//
//  question.swift
//  feelae
//
//  Created by victor billard-madrieres on 03/07/2018.
//  Copyright © 2018 Thibaut Marsal. All rights reserved.

import Foundation
import SwiftyJSON

class Question : NSObject{
    
    var id: String
    var question: String?
    var response: [Question]?
    var pageType: String
    var conclusion: String?
    var subTitle: String?
    var title: String?
    
    init( id: String, question: String, pageType: String, response: [Question]?, conclusion: String?, title: String?, subTitle: String?) {
        self.question = question
        self.id = id
        self.pageType = pageType
        self.subTitle = subTitle
        self.title = title
        self.response = response
        self.conclusion = conclusion
    }
    
    init(json: JSON) {
        self.question = json["question"].stringValue
        self.id = json["id"].stringValue
        self.pageType = json["pageType"].stringValue
        self.conclusion = json["conclusion"].stringValue
        self.title = json["title"].stringValue
        self.subTitle = json["subTitle"].stringValue
        self.response = []
        
        for response in json["answers"].arrayValue {
            let answer = Question(json: response)
            self.response?.append(answer)
        }
    }
    
    func getQuestion() -> String? {
        return question
    }
    
    func getPageType() -> String {
        return pageType
    }
    
    func getResponse() -> [Question]? {
        return response
    }
    
    func getConclusion() -> String? {
        return conclusion
    }
    
    func getId() -> String {
        return id
    }
    
    func getSubTitle() -> String? {
        return subTitle
    }
    
    func getTitle() -> String? {
        return title
    }
}
