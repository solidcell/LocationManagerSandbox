import UIKit

class VariableCell: UITableViewCell {
    
    static var cellIdentifier: String { return "VariableCellIdentifier" }

    private var inputViewDisplayer: InputViewDisplayer?
    private var dataSource: InputViewDataSource!

    @IBOutlet weak var titleLabel: UILabel!

    @IBAction func didTapEditButton(sender: UIButton) {
        self.inputViewDisplayer = InputViewDisplayer(for: self, dataSource: dataSource)
    }

    func configure(dataSource: InputViewDataSource, title: String) {
        self.dataSource = dataSource
        titleLabel.text = title
    }

}
