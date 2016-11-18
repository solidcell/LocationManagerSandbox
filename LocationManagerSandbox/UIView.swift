import UIKit

protocol NibLoadable {
    static func fromNib() -> UIView
}

extension NibLoadable {
    static func fromNib() -> Self {
        return Bundle.main.loadNibNamed(String(describing: self), owner: nil, options: nil)![0] as! Self
    }
}

extension UIView: NibLoadable {}
