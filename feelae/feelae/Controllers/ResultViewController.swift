//
//  ResultViewController.swift
//  feelae
//
//  Created by Johanna Khenkittisak on 04/07/2018.
//  Copyright © 2018 Thibaut Marsal. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController{
    
    let dataTransfer: dataTransformer = dataTransformer()
    let navigation: NavigationControllerDelegate = NavigationControllerDelegate()
    var question : Question? = nil

    @IBOutlet weak var titleResult: UILabel!
    
    let docImg = [UIImage(named:  "check"),UIImage(named:  "check"),UIImage(named:  "check")]
    let hours = ["16h50","17h05","17h10"]
    let name = ["Dr. Nozman","Dr. Velyne","Dr. Kuberg"]
    let spec = ["Médecin généraliste","Médecin généraliste","Médecin généraliste"]
    let availability = ["réserver","réserver","réserver"]
    let call = [UIImage(named:  "check"),UIImage(named:  "check"),UIImage(named:  "check")]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleResult.text = question?.getTitle()

        // Do any additional setup after loading the view .
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func changeView(controller: UIViewController){
        self.navigationController?.pushViewController(controller, animated: false)
    }
}
