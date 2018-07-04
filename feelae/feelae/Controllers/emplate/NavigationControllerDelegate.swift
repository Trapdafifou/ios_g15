//
//  NavigationController.swift
//  feelae
//
//  Created by victor billard-madrieres on 03/07/2018.
//  Copyright © 2018 Thibaut Marsal. All rights reserved.
//

import Foundation
import UIKit

class NavigationControllerDelegate {
    
    let dataTransfer: dataTransformer = dataTransformer()
    var question: Question? = nil
    
    func ReturnPageType(question: Question, response: String) -> UIViewController?{
        self.question = question
        // return double choice question page
        if( response != "pass"){
            for responses in (self.question?.getResponse()!)!{
                if(responses.getId()  == response){
                    self.question = responses
                    print(self.question?.getId(), "id1")
                    break
                }
            }
        }
        print(self.question?.getId(), "id2")
        
        if( self.question?.getPageType() == "doubleChoiceQuestion" ){
            let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            let controller = storyboard.instantiateViewController(withIdentifier: "SymptomController") as! SymptomeController
                controller.question = self.question
            
            return controller
        }else if (self.question?.getPageType() == "bodyMan"){
            let storyboard:UIStoryboard = UIStoryboard(name: "checking", bundle: nil)
            
            let controller = storyboard.instantiateViewController(withIdentifier: "CheckingController") as! CheckingController
            controller.question = self.question
            
            return controller
        }else{
            print(self.question?.getPageType(), "pagetype")
        }
        return nil
    }
    
}
