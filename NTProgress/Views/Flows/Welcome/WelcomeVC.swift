import UIKit

class WelcomeVC: UIViewController {
   
    @IBOutlet weak var welomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welomeLabel.text = """
        FIND YOUR
        MUSIC
        ON ITUNES
        """
    }
    
    @IBAction func returnToWelcome(segue: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func goToMusicSearchFlow(_ sender: Any) {
        self.performSegue(withIdentifier: "toMusicSearch", sender: self)
    }
}
