//
//  CheckingController.swift
//  feelae
//
//  Created by victor billard-madrieres on 04/07/2018.
//  Copyright © 2018 Thibaut Marsal. All rights reserved.
//

import UIKit

class CheckingController: UIViewController, ChildToParentProtocol{
    
    @IBOutlet weak var titleResult: UILabel!
    @IBOutlet weak var subtitleResult: UILabel!
    
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
        if(question?.getSubTitle() == "Avez-vous mal à la zone présentée ci-dessous ?"){
            let controllerToSend = navigation.ReturnPageType(question: self.question!, response: "oui")
            self.changeView(controller: controllerToSend!)
        }else if(question?.getSubTitle() == "Sélectionnez la zone douloureuse"){
            let controllerToSend = navigation.ReturnPageType(question: self.question!, response: self.response)
            self.changeView(controller: controllerToSend!)
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? BodyController,
            segue.identifier == "CheckinToBody" {
            vc.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleResult.text = question?.getTitle()
        subtitleResult.text = question?.getSubTitle()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func changeView(controller: UIViewController){
        self.navigationController?.pushViewController(controller, animated: false)
    }
    
    func buttonClicked(value: String?) {
        self.response = value!
    }
}
