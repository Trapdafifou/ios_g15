import Foundation
import SwiftyJSON

class dataTransformer {
    
    let url = Bundle.main.path(forResource: "../Model/data", ofType: "json")
    
    func transform(url:String )->[question]?{
        if (url != "") {
            let question: [question]
            
            let jsonFilePath:NSString = Bundle.main.path(forResource:"../Model/data", ofType: "json")! as NSString
            let jsonData:NSData = NSData(contentsOfFile: jsonFilePath as String) as! NSData
            
           // let json = JSON(data: jsonData as Data)
          //  print(json)
            
            //print(json["question"]["question"] ?? "default")
           // if let username = json["question"]["question"].string {
            //    print(username)
            //}
        }
        return nil
    }
}

