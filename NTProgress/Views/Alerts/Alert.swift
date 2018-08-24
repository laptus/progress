import UIKit

struct Alert {
    static func showRequestError(for vc: UIViewController) {
        showAlert(for: vc,
                  title: "Error",
                  message: "Wrong Data Entered")
    }
    
    private static func showInputError(for vc: UIViewController) {
        showAlert(for: vc,
                  title: "Error",
                  message: "Wrong Data Entered")
    }
    
    private static func showAlert(for vc: UIViewController,
                                  title: String,
                                  message: String) {
        
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: UIAlertControllerStyle.alert)
        let action = UIAlertAction(title: "OK",
                                   style: UIAlertActionStyle.default,
                                   handler: nil)
        alertController.addAction(action)
        DispatchQueue.main.async {
            vc.present(alertController, animated: false)
        }
    }
}
