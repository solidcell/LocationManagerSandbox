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

    var follow = true

    func scrolledToBottom(_ scrollView: UIScrollView) -> Bool {
        let bottomContentOffset = scrollView.contentSize.height - scrollView.frame.height
        let scrollOffset = scrollView.contentOffset.y
        return scrollOffset >= bottomContentOffset
    }

    var userDragging = false
    var userDecelerating = false
    
    var userScrolling: Bool {
        return userDragging || userDecelerating
    }

    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if !userScrolling { return }

        follow = scrolledToBottom(scrollView)
    }

    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        userDragging = true
    }

    override func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        userDragging = false
    }

    override func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        userDecelerating = true
    }

    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        userDecelerating = false
    }

}

extension LogTableViewController: LogDataDelegate {

    func didAddEntry(at index: Int) {
        let indexPath = IndexPath(row: index, section: 0)
        insertCell(at: indexPath)
        possiblyScrollTo(indexPath)
    }

    private func insertCell(at indexPath: IndexPath) {
        tableView.insertRows(at: [indexPath], with: .top)
    }

    private func possiblyScrollTo(_ indexPath: IndexPath) {
        if !follow { return }
        
        tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
    }

}
