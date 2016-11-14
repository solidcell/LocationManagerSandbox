import UIKit

class MethodSectionTableViewController: UITableViewController {

    var delegate: MethodSectionDelegate!
    var dataSource: MethodSectionDataSource!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = delegate
        dataSource.configure(for: tableView)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController!.setNavigationBarHidden(false, animated: true)
    }
    
}
