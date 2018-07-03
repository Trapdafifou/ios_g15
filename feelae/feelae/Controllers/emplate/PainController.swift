//
//  PainController.swift
//  feelae
//
//  Created by victor billard-madrieres on 03/07/2018.
//  Copyright © 2018 Thibaut Marsal. All rights reserved.
//

import UIKit

class PainController: UIViewController {
    var delegate:PassDataDelegate?
    
    @IBAction func buttonAddProduct(_ sender: Any) {
        //code
        if let deleg = delegate
        {
            deleg.didAddProduct(product: "product")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

