import UIKit

class RangeTempController: UIViewController {
    
    let navigation: NavigationControllerDelegate = NavigationControllerDelegate()
    var question : Question? = nil
    
    @IBOutlet weak var ReturnButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBAction func ReturnButtonChecked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func viewTapped(_ sender: UIButton) {
        print("next in temp range")
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
