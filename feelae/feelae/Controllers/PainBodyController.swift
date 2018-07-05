//
//  PainDollController.swift
//  feelae
//
//  Created by Thibaut Marsal on 05/07/2018.
//  Copyright © 2018 Thibaut Marsal. All rights reserved.
//

import UIKit

class PainBodyController: UIViewController, PainBodyToPainScaleProtocol {
    
    var response: String = ""
    var question : Question? = nil
    
    let navigation: NavigationControllerDelegate = NavigationControllerDelegate()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? PainScaleController,
            segue.identifier == "PainBodyToPainScale" {
            vc.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scaleClicked(value: Int) {
        print(value)
        var controllerToSend = navigation.ReturnPageType(question: question!, response: String(value))
        self.changeView(controller: controllerToSend!)
    }

    func changeView(controller: UIViewController){
        self.navigationController?.pushViewController(controller, animated: false)
    }
}
