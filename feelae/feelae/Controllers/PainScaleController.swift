//
//  ViewController.swift
//  feelae
//
//  Created by Thibaut Marsal on 02/07/2018.
//  Copyright © 2018 Thibaut Marsal. All rights reserved.
//

import UIKit

protocol PainBodyToPainScaleProtocol:class {
    func scaleClickedValue(value: Int)
}

class PainScaleController: UIViewController {
    
    @IBOutlet var painScale: [UIButton]!
    
     weak var delegate:PainBodyToPainScaleProtocol? = nil
    let painScaleIndex: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setScale()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setScale () {
        for scale in painScale {
            scale.addTarget(self, action: #selector(scaleClicked(_:)), for: .touchUpInside)
        }
    }
    
    @objc func scaleClicked(_ sender:UIButton!) {
        
        sender.backgroundColor = UIColor(red:247, green:134, blue:45, alpha:1.0)
        delegate?.scaleClickedValue(value: sender.tag)
    }
}

