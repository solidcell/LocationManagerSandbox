import UIKit

class VariableCell: UITableViewCell {
    
    static var cellIdentifier: String { return "VariableCellIdentifier" }

    var inputData: InputView.Data!
    var dataSelected: (([Int]) -> Void)!
    private var inputViewDisplayer: InputViewDisplayer?

    @IBOutlet weak var titleLabel: UILabel!

    @IBAction func didTapEditButton(sender: UIButton) {
        self.inputViewDisplayer = InputViewDisplayer(for: self,
                                                     data: self.inputData,
                                                     dataSelected: self.dataSelected)
    }
    
}
