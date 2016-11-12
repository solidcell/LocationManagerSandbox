import UIKit

class MethodSectionTableViewController: UITableViewController {

    let delegate: MethodSectionDelegate
    let dataSource: MethodSectionDataSource

    init(delegate: MethodSectionDelegate,
         dataSource: MethodSectionDataSource,
         title: String) {
        self.delegate = delegate
        self.dataSource = dataSource
        super.init(style: .plain)
        self.title = title
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = delegate
        dataSource.configure(for: tableView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}
