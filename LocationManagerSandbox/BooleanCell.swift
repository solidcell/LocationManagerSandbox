import UIKit

class BooleanCell: UITableViewCell {
    
    static let cellIdentifier = "BooleanCellIdentifier"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var switchOutlet: UISwitch!

    private var executor: MethodExecutor!
    private var boolean: MethodExecutor.BoolEnum!

    func configure(executor: MethodExecutor, boolean: MethodExecutor.BoolEnum) {
        self.executor = executor
        self.boolean = boolean
        titleLabel.text = String(describing: boolean)
        updateSwitchState()
    }
    
    @IBAction func switchAction(_ sender: UISwitch) {
        executor.set(boolean, sender.isOn)
        updateSwitchState()
    }

    private func updateSwitchState() {
        switchOutlet.isOn = executor.get(boolean)
    }

}
