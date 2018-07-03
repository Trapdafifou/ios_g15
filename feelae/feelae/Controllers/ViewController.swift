//
//  ViewController.swift
//  feelae
//
//  Created by Thibaut Marsal on 02/07/2018.
//  Copyright © 2018 Thibaut Marsal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var buttonsTab: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for button in buttonsTab {
            emptyButton(button: button)
            button.setBackgroundImage(UIImage(named: "radio-on-button"), for: .normal)
            button.addTarget(self, action: #selector(setBackground(_:)), for: .touchUpInside)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func setBackground(_ sender:UIButton!)
    {
        for button in buttonsTab {
            emptyButton(button: button)
        }
        print(sender.tag)
        sender.alpha = 1
        print(sender)
    }
    
    func emptyButton (button: UIButton) {
        button.setTitle("", for: .normal)
        button.alpha = 0.2
    }
}

