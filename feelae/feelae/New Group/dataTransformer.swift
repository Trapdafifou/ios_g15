import Foundation
import SwiftyJSON

class dataTransformer {
    
    func transform()-> Question? {
        let url = Bundle.main.path(forResource: "../Model/data", ofType: "json")
        
        if (url != "") {
            let _: Question
            
            if let jsonFilePath = Bundle.main.path(forResource:"data", ofType: "json"){
                do{
                    let data = try Data(contentsOf: URL(fileURLWithPath: jsonFilePath), options: [])
                    let json = JSON(data)
                    let mainQuestion = Question(json: json["Seasonal"])
                    return mainQuestion
                }catch{
                    print("error")
                }
            }
        }
        return nil
    }
}


