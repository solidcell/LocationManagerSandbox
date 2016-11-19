import UIKit

class VariableCell: UITableViewCell {
    
    static var cellIdentifier: String { return "VariableCellIdentifier" }

    var inputData: InputView.Data!
    var dataSelected: (([Int]) -> Void)!

    @IBOutlet weak var titleLabel: UILabel!

    @IBAction func didTapEditButton(sender: UIButton) {
        inputViewDisplayer.show()
    }

    private lazy var inputViewDisplayer: InputViewDisplaying = {
        return InputViewDisplayer(for: self,
                                  data: self.inputData,
                                  dataSelected: self.dataSelected)
    }()
    
}
