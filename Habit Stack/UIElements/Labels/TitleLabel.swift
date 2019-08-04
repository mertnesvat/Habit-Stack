import UIKit

class TitleLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
        
    }
    
    func setup() {
        self.font = UIFont.heading1
        self.textColor = UIColor.mainTextColor
    }
}

class DescriptionLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
        
    }
    
    func setup() {
        self.font = UIFont.desc
        self.textColor = UIColor.mainTextColor
    }
}
