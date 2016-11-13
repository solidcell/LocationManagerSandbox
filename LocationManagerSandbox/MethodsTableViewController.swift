import UIKit

class MethodsTableViewController: UITableViewController {

    let data = MethodsData()
    var methodExecutor: MethodExecutor!
    
    lazy var dataSouce: MethodsDataSource = {
        return MethodsDataSource(data: self.data)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = dataSouce
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = data.sections[indexPath.row]
        let dataSource = MethodSectionDataSource(methodSection: section)
        let delegate = MethodSectionDelegate(methodSection: section,
                                             executor: methodExecutor)
        let methodSectionVC = MethodSectionTableViewController(delegate: delegate,
                                                               dataSource: dataSource,
                                                               title: section.name)
        navigationController!.pushViewController(methodSectionVC, animated: true)
    }

}
