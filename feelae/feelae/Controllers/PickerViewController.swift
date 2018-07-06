import UIKit

class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    
    @IBOutlet weak var textBox: UITextField!
    
    
    @IBOutlet weak var dropDown: UIPickerView!
    
    let dataTransfer: dataTransformer = dataTransformer()
    let navigation: NavigationControllerDelegate = NavigationControllerDelegate()
    var question : Question? = nil
    @IBOutlet weak var Returnbutton: UIButton!
    
    @IBOutlet weak var ButtonNext: UIButton!
    var list = [String]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for propal in (self.question?.getResponse()!)!{
            self.list.append(propal.getId())
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
        
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        
        return self.list.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        self.view.endEditing(true)
        return self.list[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.textBox.text = self.list[row]
        self.dropDown.isHidden = true
        
        
        
    }
    @IBAction func NextChecked(_ sender: UIButton) {
        let controllerToSend = navigation.ReturnPageType(question: self.question!, response: "headache")
        self.changeView(controller: controllerToSend!)
    }
    
    @IBAction func ReturnbuttonChecked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == self.textBox {
            self.dropDown.isHidden = false
            //if you dont want the users to se the keyboard type:
            
            textField.endEditing(true)
        }
        
    }
    
    func changeView(controller: UIViewController){
        self.navigationController?.pushViewController(controller, animated: false)
    }
}
