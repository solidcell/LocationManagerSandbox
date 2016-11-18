import UIKit

class VariableCell: UITableViewCell {
    
    static let cellIdentifier = "VariableCellIdentifier"

    @IBOutlet weak var titleLabel: UILabel!

    @IBAction func didTapEditButton(sender: UIButton) {
        print("tapped")
    }
    
}
