import UIKit

class VariableCell: UITableViewCell {
    
    static let cellIdentifier = "VariableCellIdentifier"

    @IBOutlet weak var titleLabel: UILabel!

    @IBAction func didTapEditButton(sender: UIButton) {
        inputViewDisplayer.show()
    }

    private lazy var inputViewDisplayer: InputViewDisplaying = {
        return InputViewDisplayer(for: self)
    }()
    
}
