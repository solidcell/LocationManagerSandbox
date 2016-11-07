import UIKit

class MethodTableViewController: UITableViewController {

    let dataSouce = MethodsDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = dataSouce
    }
    
}
