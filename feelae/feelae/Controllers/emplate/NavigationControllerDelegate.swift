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
                    break
                }
            }
        }
        
        if( self.question?.getConclusion() == "Parcours-normal" ){
            self.question = dataTransfer.getNormalWorkflow()
        }
        
        
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
            
        }else if (self.question?.getPageType() == "bodyMan-checkup"){
            let storyboard:UIStoryboard = UIStoryboard(name: "checking", bundle: nil)
            
            let controller = storyboard.instantiateViewController(withIdentifier: "CheckingController") as! CheckingController
            controller.question = self.question
            
            return controller
        }else if (self.question?.getPageType() == "rangeTemp"){
            let storyboard:UIStoryboard = UIStoryboard(name: "rangeTemp", bundle: nil)
            
            let controller = storyboard.instantiateViewController(withIdentifier: "RangeTempController") as! RangeTempController
            
            controller.question = self.question
            
            return controller
        }else if (self.question?.getPageType() == "recap"){
            let storyboard:UIStoryboard = UIStoryboard(name: "Result", bundle: nil)
            
            let controller = storyboard.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
            
            controller.question = self.question
            
            return controller
        }else if (self.question?.getPageType() == "precisionList"){
            let storyboard:UIStoryboard = UIStoryboard(name: "TableView", bundle: nil)

            let controller = storyboard.instantiateViewController(withIdentifier: "CheckListViewController") as! CheckListViewController
            
            controller.question = self.question
            
            return controller
        }else if (self.question?.getPageType() == "rangeIntensite"){
            let storyboard:UIStoryboard = UIStoryboard(name: "PainBody", bundle: nil)
            
            let controller = storyboard.instantiateViewController(withIdentifier: "PainBodyController") as! PainBodyController
            
            controller.question = self.question
            
            return controller
        }
        else if (self.question?.getPageType() == "addSymptoms"){
            let storyboard:UIStoryboard = UIStoryboard(name: "Picker", bundle: nil)
            
            let controller = storyboard.instantiateViewController(withIdentifier: "PickerViewController") as! PickerViewController
            
            controller.question = self.question
            
            return controller
        }else{
            print(self.question?.getPageType(), "pagetype")
        }
        return nil
    }
    
}
