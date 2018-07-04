//
//  CheckingController.swift
//  feelae
//
//  Created by victor billard-madrieres on 04/07/2018.
//  Copyright © 2018 Thibaut Marsal. All rights reserved.
//

import UIKit

class CheckingController: UIViewController {
    
    let navigation: NavigationControllerDelegate = NavigationControllerDelegate()
    var response: String = ""
    var question : Question? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func changeView(controller: UIViewController){
        self.navigationController?.pushViewController(controller, animated: false)
    }
    
}
