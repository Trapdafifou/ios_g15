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
    
    func ReturnPageType(question: Question, response: String) -> UIViewController?{
        // return double choice question page
        if( response != "pass"){
            for responses in question.getResponse()!{
                if(responses.getId()  == response){
                    var question = responses
                    break
                }
            }
        }
        print(question.getId())
        
        if( question.getPageType() == "doubleChoiceQuestion" ){
            let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            //controller_.question = question.getResponse()
            let controller = storyboard.instantiateViewController(withIdentifier: "SymptomController") as! SymptomeController
            
            return controller
        }else{
            print("error")
        }
        return nil
    }
    
}
