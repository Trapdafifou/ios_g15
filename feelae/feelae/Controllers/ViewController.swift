//
//  ViewController.swift
//  feelae
//
//  Created by Thibaut Marsal on 02/07/2018.
//  Copyright © 2018 Thibaut Marsal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let dataTransfer: dataTransformer = dataTransformer()
    let navigation: NavigationControllerDelegate = NavigationControllerDelegate()
    var question : [Question]? = nil
    var response: String = ""
    
    @IBAction func ButtonClicked(_ sender: UIButton) {
        var mainQuestion = dataTransfer.transform()
        var controllerToSend = navigation.ReturnPageType(question: mainQuestion!, response: "pass")
        self.changeView(controller: controllerToSend!)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func changeView(controller: UIViewController){
        self.navigationController?.pushViewController(controller, animated: false)
    }
}

