//
//  dataTransformer.swift
//  feelae
//
//  Created by victor billard-madrieres on 03/07/2018.
//  Copyright © 2018 Thibaut Marsal. All rights reserved.
//

import Foundation

class dataTransformer {
    
    let path = Bundle.main.path(forResource: "Model/data", ofType: "json")
    
    func transform( path:String )->[question]{
        if (path != "") {
            let question: [question]
            
            let json = JSON(data: dataFromNetworking)
            if let userName = json[0]["user"]["name"].string {
                //Now you got your value
            }
        return question
    }
}

