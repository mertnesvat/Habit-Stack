import UIKit

extension UIColor {
    static var mainTextColor: UIColor { return UIColor().color(hex: "#314259") }
    static var brandOrange: UIColor { return UIColor().color(hex: "#FFA693") }
    static var brandPink: UIColor { return UIColor().color(hex: "#FE979C") }
    static var titleGray: UIColor { return UIColor().color(hex: "#90A4B7") }
    static var tabBarBlue: UIColor { return UIColor().color(hex: "#414B6B") }
    
}

extension UIFont {
    static var heading1: UIFont {
        return UIFont(name: "Avenir-Heavy", size: 25) ?? UIFont.systemFont(ofSize: 25)
    }
    
    static var heading2: UIFont {
        return UIFont(name: "Avenir-Light", size: 20) ?? UIFont.systemFont(ofSize: 20)
    }
    
    static var heading3: UIFont {
        return UIFont(name: "Avenir-Light", size: 18) ?? UIFont.systemFont(ofSize: 17)
    }
    
    static var normal: UIFont {
        return UIFont(name: "Avenir-Light", size: 15) ?? UIFont.systemFont(ofSize: 15)
    }
    
    static var desc: UIFont {
        return UIFont(name: "Avenir-Light", size: 14)?.withTraits(traits: UIFontDescriptor.SymbolicTraits.traitItalic) ?? UIFont.systemFont(ofSize: 14)
    }
    
    static var typeTagSmallText: UIFont {
        return UIFont(name: "Avenir-Light", size: 12) ?? UIFont.systemFont(ofSize: 12)
    }
}
