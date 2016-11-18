import UIKit

class VariableCell: UITableViewCell {
    
    static let cellIdentifier = "VariableCellIdentifier"

    @IBOutlet weak var titleLabel: UILabel!

    @IBAction func didTapEditButton(sender: UIButton) {
        let inputAccessoryView = InputAccessoryView.fromNib()
        inputViewTrigger.inputAccessoryView = inputAccessoryView
        inputViewTrigger.becomeFirstResponder()
    }

    private let inputViewTrigger = UITextField()

    override func awakeFromNib() {
        super.awakeFromNib()
        addSubview(inputViewTrigger)
    }
    
}
