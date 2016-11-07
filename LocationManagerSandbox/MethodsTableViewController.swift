import UIKit

class MethodsTableViewController: UITableViewController {

    let data = MethodsData()
    let methodExecutor = MethodExecutor()
    
    lazy var delegate: MethodsDelegate = {
        return MethodsDelegate(data: self.data,
                               executor: self.methodExecutor)
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
