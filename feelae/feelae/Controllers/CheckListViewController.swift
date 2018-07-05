//
// CheckListController.swift
//  feelae
//
//  Created by Johanna Khenkittisak on 03/07/2018.
//  Copyright © 2018 Thibaut Marsal. All rights reserved.
//

import UIKit

class CheckListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    var question : Question? = nil
    var response = ""
    let navigation: NavigationControllerDelegate = NavigationControllerDelegate()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var PreviousButton: UIButton!
    @IBOutlet weak var ButtonNext: UIButton!
    
    @IBOutlet weak var checkListTitle: UILabel!
    @IBOutlet weak var checkListSubtitle: UILabel!
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.checkListTitle.text = question?.getTitle()
        self.checkListSubtitle.text = question?.getSubTitle()
        for response in (self.question?.getResponse()!)! {
            parts.append(response.getId())
        }
    }
    
    var parts = [String]()
    
   

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = parts[indexPath.row]
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
    
    @IBAction func NextChecked(_ sender: UIButton) {
        let controllerToSend = navigation.ReturnPageType(question: self.question!, response: "loge posterieure")
        self.changeView(controller: controllerToSend!)
    }
    @IBAction func PreviousChecked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func changeView(controller: UIViewController){
        self.navigationController?.pushViewController(controller, animated: false)
    }

}
