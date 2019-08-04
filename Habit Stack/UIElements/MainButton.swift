import UIKit

class MainButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        self.backgroundColor = .white
        self.tintColor = UIColor.mainTextColor
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = true
        self.titleLabel?.font = UIFont.heading2
    }
}
