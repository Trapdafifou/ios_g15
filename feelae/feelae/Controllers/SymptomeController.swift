
import UIKit

class SymptomeController: UIViewController {
    
    let dataTransfer: dataTransformer = dataTransformer()
    let navigation: NavigationControllerDelegate = NavigationControllerDelegate()
    var question : Question? = nil
    
    @IBOutlet weak var YesButton: UIButton!
    @IBOutlet weak var NoButton: UIButton!
    
    @IBAction func NoAction(_ sender: UIButton) {
        var mainQuestion = dataTransfer.transform()
        var pageType = mainQuestion?.getPageType()
        //var controllerToSend = navigation.ReturnPageType(pageType: pageType!)
        //self.changeView(controller: controllerToSend)
    }
    
    @IBAction func YEsAction(_ sender: UIButton) {
        var mainQuestion = dataTransfer.transform()
        var pageType = mainQuestion?.getPageType()
     //   var controllerToSend = navigation.ReturnPageType(pageType: pageType!)
     //   self.changeView(controller: controllerToSend)
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
