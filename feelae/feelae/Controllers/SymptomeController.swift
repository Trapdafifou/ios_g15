//
//  SymptomeController.swift
//  feelae
//
//  Created by Thibaut Marsal on 02/07/2018.
//  Copyright © 2018 Thibaut Marsal. All rights reserved.
//

import UIKit

class SymptomeController: UIViewController, PassDataDelegate {
    @IBAction func ButtonTrueClicked(_ sender: UIButton) {
    }
    
    @IBOutlet weak var ButtonFalse: UIButton!
    @IBOutlet weak var ButtonYes: UIButton!
    
    @IBAction func ButtonFalseClicked(_ sender: UIButton) {
    }
    let dataTransfer: dataTransformer = dataTransformer()
    let url = Bundle.main.path(forResource: "../Model/data", ofType: "json")
    
    var segueShowPainIdentifier = "showPain"
    var painController: PainController?
    
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
