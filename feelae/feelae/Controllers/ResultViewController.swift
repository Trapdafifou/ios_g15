//
//  ResultViewController.swift
//  feelae
//
//  Created by Johanna Khenkittisak on 04/07/2018.
//  Copyright © 2018 Thibaut Marsal. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    let docImg = [UIImage(named:  "check"),UIImage(named:  "check"),UIImage(named:  "check")]
    let hours = ["16h50","17h05","17h10"]
    let name = ["Dr. Nozman","Dr. Velyne","Dr. Kuberg"]
    let spec = ["Médecin généraliste","Médecin généraliste","Médecin généraliste"]
    let availability = ["réserver","réserver","réserver"]
    let call = [UIImage(named:  "check"),UIImage(named:  "check"),UIImage(named:  "check")]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
