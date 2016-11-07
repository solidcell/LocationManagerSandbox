import UIKit

class MethodsTableViewController: UITableViewController {

    let data = MethodsData()
    
    lazy var delegate: MethodsDelegate = {
        return MethodsDelegate(data: self.data)
    }()
    
    lazy var dataSouce: MethodsDataSource = {
        return MethodsDataSource(data: self.data)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = dataSouce
        tableView.delegate = delegate
    }
    
}
