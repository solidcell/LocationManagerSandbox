import UIKit

class LogTableViewController: UITableViewController, LogDataDelegate {

    var dataSource: LogDataSource!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = dataSource
    }

    func didAddEntry(at index: Int) {
        let indexPath = IndexPath(row: index, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .top)
        ensureIndexPathIsVisible(indexPath)
    }

    private func ensureIndexPathIsVisible(_ indexPath: IndexPath) {
        tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
    }

}
