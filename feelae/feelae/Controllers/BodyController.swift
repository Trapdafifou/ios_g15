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

class BodyController: UIViewController {
    @IBOutlet weak var bodyPartName: UILabel!
    @IBOutlet var buttonsTab: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let labelSize = CGSize(width: bodyPartName.frame.width + 20, height: bodyPartName.frame.height + 20)
        let size = bodyPartName.sizeThatFits(labelSize)
        bodyPartName.frame = CGRect(origin: CGPoint(x: 100, y: 100), size: size)
        
        bodyPartName.backgroundColor = UIColor(patternImage: UIImage(named: "Info")!.resized(newSize: CGSize(width: bodyPartName.frame.width + 10, height: bodyPartName.frame.height)))
        
        setButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setButton () {
        var indexTab = 0
        for button in buttonsTab {
            button.tag = indexTab
            emptyButton(button: button)
            fillButton(button: button)
            print(button.tag)
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
        let posY = sender.frame.origin.y + sender.frame.height / 2.5
        
        bodyPartName.center = CGPoint(x: posX, y:posY)
        
        sender.alpha = 1
    }
    
    func emptyButton (button: UIButton) {
        button.setTitle("", for: .normal)
        button.alpha = 0.2
    }
    
    func fillButton (button: UIButton) {
        let image = UIImage(named: "radio-on-button")!.resized(newSize: CGSize(width: 19, height: 19))
        button.setImage(image, for: .normal)
    }

}
