
import UIKit

class SymptomeController: UIViewController {
    @IBAction func ButtonTrueClicked(_ sender: UIButton) {
        
    }
    
    @IBOutlet weak var ButtonFalse: UIButton!
    @IBOutlet weak var ButtonYes: UIButton!
    
    @IBAction func ButtonFalseClicked(_ sender: UIButton) {
        
    }
    let dataTransfer: dataTransformer = dataTransformer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataTransfer.transform()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
