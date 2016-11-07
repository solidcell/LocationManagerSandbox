import UIKit

class LogTableViewController: UITableViewController, LogDataDelegate {

    var dataSource: LogDataSource!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = dataSource
    }

    func didAddEntry(at index: Int) {
        let indexPaths = [IndexPath(row: index, section: 0)]
        tableView.insertRows(at: indexPaths, with: .top)
    }

}
