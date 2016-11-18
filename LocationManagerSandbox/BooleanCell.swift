import UIKit

class BooleanCell: UITableViewCell {
    
    static let cellIdentifier = "BooleanCellIdentifier"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var switchOutlet: UISwitch!

    var getValue: (() -> Bool?)! {
        didSet { ensureValueIsCorrect() }
    }
    var switchCallback: ((Bool) -> Void)!
    
    @IBAction func switchAction(_ sender: UISwitch) {
        switchCallback(sender.isOn)
        ensureValueIsCorrect()
    }

    private func ensureValueIsCorrect() {
        switchOutlet.isOn = getValue?() ?? false
    }

}
