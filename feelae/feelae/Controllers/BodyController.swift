//
//  BodyController.swift
//  feelae
//
//  Created by Thibaut Marsal on 05/07/2018.
//  Copyright © 2018 Thibaut Marsal. All rights reserved.
//

import UIKit

extension UIImage {
    func resized(newSize:CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(newSize, false, UIScreen.main.scale)
        self.draw(in: CGRect(origin: CGPoint(x: 0,y :0), size: newSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}

protocol BodyDataToMaster {
    func changeLabel(text:String)
}

class BodyController: UIViewController {
    let dataTransfer: dataTransformer = dataTransformer()
    let navigation: NavigationControllerDelegate = NavigationControllerDelegate()
    var question : Question? = nil
    
    @IBOutlet weak var bodyPartName: UILabel!
    @IBOutlet var buttonsTab: [UIButton]!
    
    var bodyPartTab: [Int: String] = [
            0: "Tête",
            1: "Cou",
            2: "Torse",
            3: "Estomac",
            4: "Bras droit",
            5: "Avant-bras droit",
            6: "Main droite",
            7: "Bras gauche",
            8: "Avant-bras gauche",
            9: "Main gauche",
            10: "Cuisse gauche",
            11: "Bas de jambe droite",
            12: "Cuisse droite",
            13: "Bas de jambe gauche"
        ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setButton () {
        var indexTab = 0
        for button in buttonsTab {
            emptyButton(button: button)
            fillButton(button: button)
            button.addTarget(self, action: #selector(setBackground(_:)), for: .touchUpInside)
            indexTab += 1
        }
    }

    @objc func setBackground(_ sender:UIButton!)
    {
        for button in buttonsTab {
            emptyButton(button: button)
        }
        let posX = sender.frame.origin.x + sender.frame.width / 2
        let posY = sender.frame.origin.y + sender.frame.height / 2 - 19
        
        bodyPartName.text = bodyPartTab[sender.tag]
        redrawLabel(label: bodyPartName)
        bodyPartName.center = CGPoint(x: posX, y:posY)
        bodyPartName.layer.zPosition = 1;
        sender.alpha = 1
        
        /* let controllerToSend = navigation.ReturnPageType(question: question!, response: "jambeDroite")
        self.changeView(controller: controllerToSend!) */
    }
    
    func redrawLabel(label: UILabel) {
        label.alpha = 1
        let labelSize = CGSize(width: label.frame.width + 20, height: label.frame.height + 20)
        let size = label.sizeThatFits(labelSize)
        label.frame = CGRect(origin: CGPoint(x: 100, y: 100), size: size)
        label.backgroundColor = UIColor(patternImage: UIImage(named: "Info")!.resized(newSize: CGSize(width: label.frame.width, height: label.frame.height + 30)))
        label.sizeToFit()
    }
    
    func emptyButton (button: UIButton) {
        button.setTitle("", for: .normal)
        button.alpha = 0.2
    }
    
    func fillButton (button: UIButton) {
        let image = UIImage(named: "radio-on-button")!.resized(newSize: CGSize(width: 19, height: 19))
        button.setImage(image, for: .normal)
    }
    
    func changeView(controller: UIViewController){
        self.navigationController?.pushViewController(controller, animated: false)
    }

}
