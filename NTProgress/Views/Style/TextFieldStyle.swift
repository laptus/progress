import Foundation
import UIKit

@IBDesignable
class MyTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    private func setupButton() {
        backgroundColor = UIColor.darkGray
        layer.cornerRadius = frame.size.height / 2
    }
}
