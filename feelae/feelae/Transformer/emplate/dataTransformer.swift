import Foundation
import SwiftyJSON

class dataTransformer {
    
    func transform(){
        let url = Bundle.main.path(forResource: "../Model/data", ofType: "json")
        
        if (url != "") {
            let _: question
            
            if let jsonFilePath = Bundle.main.path(forResource:"data", ofType: "json"){
                do{
                    let data = try Data(contentsOf: URL(fileURLWithPath: jsonFilePath), options: [])
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:question]
                    print(json)
                }catch{
                    print("error")
                }
            }
        }
        
    }
}

