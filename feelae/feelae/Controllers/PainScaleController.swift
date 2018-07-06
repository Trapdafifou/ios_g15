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
            scale.layer.borderWidth = 0.5
            scale.layer.borderColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1).cgColor
            scale.addTarget(self, action: #selector(backgroundAction(_:)), for: .touchDown)
            scale.addTarget(self, action: #selector(scaleClicked(_:)), for: .touchUpInside)
        }
    }
    
    @objc func backgroundAction(_ sender:UIButton!) {
        sender.backgroundColor = UIColor(red:247.0/255.0, green:134.0/255.0, blue:45.0/255.0, alpha:1.0)
    }
    
    @objc func scaleClicked(_ sender:UIButton!) {
        delegate?.scaleClickedValue(value: sender.tag)
    }
}

