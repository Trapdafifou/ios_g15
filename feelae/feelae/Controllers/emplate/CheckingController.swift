//
//  CheckingController.swift
//  feelae
//
//  Created by victor billard-madrieres on 04/07/2018.
//  Copyright © 2018 Thibaut Marsal. All rights reserved.
//

import UIKit

class CheckingController: UIViewController {
    
    @IBOutlet weak var ReturnButton: UIButton!
    @IBOutlet weak var ButtonSuivant: UIButton!
    @IBOutlet weak var BodyContainer: UIView!
    
    let navigation: NavigationControllerDelegate = NavigationControllerDelegate()
    @IBAction func ReturnButtonChecked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    var response: String = ""
    var question : Question? = nil
    
    @IBAction func ButtonSuivantChecked(_ sender: UIButton) {
        var controllerToSend = navigation.ReturnPageType(question: question!, response: "oui")
        self.changeView(controller: controllerToSend!)
    }
    
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
