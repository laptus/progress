import UIKit

class MusicSearchVC: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchResultsTable: UITableView!
    
    let viewModel = MusicSearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        config()
    }
    
    func config() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyBoardWasShown),
                                               name: NSNotification.Name.UIKeyboardWillShow,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillBeHidden),
                                               name: NSNotification.Name.UIKeyboardWillHide,
                                               object: nil)
        
        searchResultsTable.estimatedRowHeight = 44
        searchResultsTable.rowHeight = UITableViewAutomaticDimension
        searchResultsTable.delegate = viewModel
        searchResultsTable.dataSource = viewModel
        searchTextField.addTarget(self, action: #selector(textFieldDidChange(_ :)), for: .editingChanged)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self,
                                                  name: NSNotification.Name.UIKeyboardWillShow,
                                                  object: nil)
        NotificationCenter.default.removeObserver(self,
                                                  name: NSNotification.Name.UIKeyboardWillHide,
                                                  object: nil)
    }
    
    
    
    @IBAction func returnButtonTaped(_ sender: Any) {
        performSegue(withIdentifier: "returnToWelcome", sender: self)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        //погнали запрос
        guard let searchText = searchTextField.text else {return}
        viewModel.runSearch(searchText: searchText.split(separator: " ").map(String.init), tableView: searchResultsTable)
    }
}

extension MusicSearchVC {
    @objc private func keyBoardWasShown(notification: Notification) {
        
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIKeyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsetsMake(0.0,
                                             0.0,
                                             kbSize.height,
                                             0.0)
        
        
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    @objc private func keyboardWillBeHidden(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    @objc private func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
}
