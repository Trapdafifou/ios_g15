//
//  SymptomeController.swift
//  feelae
//
//  Created by Thibaut Marsal on 02/07/2018.
//  Copyright © 2018 Thibaut Marsal. All rights reserved.
//

import UIKit

class SymptomeController: UIViewController, PassDataDelegate {

    let dataTransfer: dataTransformer = dataTransformer()
    let url = Bundle.main.path(forResource: "../Model/data", ofType: "json")
    
    var segueShowPainIdentifier = "showPain"
    var painController: PainController?
    
    
    @IBAction func ButtonAction(_ sender: Any, forEvent event: UIEvent) {
        print("yolo")
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyboard?.instantiateViewController(withIdentifier: "painController")
        
        self.present(nextViewController!, animated:true, completion:nil)
        
        //let yolo = dataTransfer.transform(url : url!)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier==segueShowPainIdentifier) {
            painController = segue.destination as? PainController
            painController?.delegate=self
        }
    }
    
    func didAddProduct(product: String) {
        print("yoloDone")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

protocol PassDataDelegate{
    func didAddProduct(product:String)
}
