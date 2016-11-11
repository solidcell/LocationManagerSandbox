import UIKit

class LogTableViewController: UITableViewController {

    var dataSource: LogDataSource!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = dataSource
        configureCellsToSelfSize()
    }

    private func configureCellsToSelfSize() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 60
    }

    // Without a cache, scrolling to rows at the bottom becomes
    // very jumpy/jittery
    private var cellHeightCache = [IndexPath : CGFloat]()

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cellHeightCache[indexPath] = cell.frame.height
    }

    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if let cachedHeight = cellHeightCache[indexPath] {
            return cachedHeight
        }
        return UITableViewAutomaticDimension
    }

}

extension LogTableViewController: LogDataDelegate {

    func didAddEntry(at index: Int) {
        let indexPath = IndexPath(row: index, section: 0)
        insertCell(at: indexPath)
        ensureIndexPathIsVisible(indexPath)
    }

    private func insertCell(at indexPath: IndexPath) {
        tableView.insertRows(at: [indexPath], with: .top)
    }

    private func ensureIndexPathIsVisible(_ indexPath: IndexPath) {
        tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
    }

}
