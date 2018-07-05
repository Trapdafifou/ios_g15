//
//  ViewController.swift
//  feelae
//
//  Created by Thibaut Marsal on 02/07/2018.
//  Copyright © 2018 Thibaut Marsal. All rights reserved.
//

import UIKit

class PainScaleController: UIViewController {
    
    
    @IBOutlet var painScale: [UIButton]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setScale () {
        var indexTab = 0
        
        
        for scale in painScale {
            scale.tag = indexTab
            
            indexTab += 1
        }
    }
}

