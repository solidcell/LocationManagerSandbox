import UIKit

class DotView: UIView {
    
    override func layoutSubviews() {
        layer.cornerRadius = bounds.size.width / 2
    }
    
}
