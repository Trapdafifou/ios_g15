
import UIKit

class SymptomeController: UIViewController {
    let dataTransfer: dataTransformer = dataTransformer()
    let navigation: NavigationControllerDelegate = NavigationControllerDelegate()
    var question : Question? = nil
    
    @IBOutlet weak var SubTitleLabel: UILabel!
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var QuestionLabel: UILabel!
    
    @IBOutlet weak var ReturnButton: UIButton!
    @IBOutlet weak var YesButton: UIButton!
    @IBOutlet weak var NoButton: UIButton!
    
    @IBAction func ReturnButtonChecked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func NoAction(_ sender: UIButton) {
        var controllerToSend = navigation.ReturnPageType(question: question!, response: "non")
        if(controllerToSend != nil){
            self.changeView(controller: controllerToSend!)
        }
    }
    
    @IBAction func YEsAction(_ sender: UIButton) {
        var controllerToSend = navigation.ReturnPageType(question: question!, response: "oui")
        self.changeView(controller: controllerToSend!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.QuestionLabel.text = self.question?.getQuestion()
        self.TitleLabel.text = self.question?.getTitle()
        self.SubTitleLabel.text = self.question?.getSubTitle()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func changeView(controller: UIViewController){
        self.navigationController?.pushViewController(controller, animated: false)
    }
}
