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

protocol ChildToParentProtocol:class {
    func buttonClicked(value: String?)
}

class BodyController: UIViewController {
    
    weak var delegate:ChildToParentProtocol? = nil
    
    @IBOutlet weak var bodyPartName: UILabel!
    @IBOutlet var buttonsTab: [UIButton]!
    
    var bodyPartTab: [Int: [String: Any]] = [
        0: [
            "name": "Tête",
            "value": "head",
            "checked": false,
        ],
        1: [
            "name": "Cou",
            "value": "head",
            "checked": false,
        ],
        2: [
            "name": "Torse",
            "value": "head",
            "checked": false,
        ],
        3: [
            "name": "Estomac",
            "value": "head",
            "checked": false,
        ],
        4: [
            "name": "Bras Droit",
            "value": "head",
            "checked": false,
        ],
        5: [
            "name": "Avant-bras droit",
            "value": "head",
            "checked": false,
        ],
        6: [
            "name": "Main droite",
            "value": "head",
            "checked": false,
        ],
        7: [
            "name": "Bras gauche",
            "value": "head",
            "checked": false,
        ],
        8: [
            "name": "Avant-bras gauche",
            "value": "head",
            "checked": false,
        ],
        9: [
            "name": "Main gauche",
            "value": "head",
            "checked": false,
        ],
        10: [
            "name": "Cuisse droite",
            "value": "jambeDroite",
            "checked": false,
        ],
        11: [
            "name": "Bas de jambe droite",
            "value": "head",
            "checked": false,
        ],
        12:[
            "name": "Cuisse Gauche",
            "value": "head",
            "checked": false,
        ],
        13: [
            "name": "Bas de jambe gauche",
            "value": "head",
            "checked": false,
        ],
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
        
        bodyPartName.text = bodyPartTab[sender.tag]?["name"] as! String
        redrawLabel(label: bodyPartName)
        bodyPartName.center = CGPoint(x: posX, y:posY)
        print(bodyPartName.frame.origin.x, bodyPartName.frame.origin.y)
        bodyPartName.layer.zPosition = 1;
        sender.alpha = 1
        
        delegate?.buttonClicked(value: bodyPartTab[sender.tag]?["value"] as! String)
        print(bodyPartName.frame.origin.x, bodyPartName.frame.origin.y)
        sender.alpha = 1
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
