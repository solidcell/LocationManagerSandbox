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
        
        navigationController!.setNavigationBarHidden(true, animated: true)
    }

    var segueingToSection: MethodsData.MethodSection?

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        segueingToSection = data.sections[indexPath.row]
        performSegue(withIdentifier: "segueToMethodSection", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let methodSectionVC = segue.destination as! MethodSectionTableViewController
        let section = segueingToSection!
        methodSectionVC.dataSource = MethodSectionDataSource(methodSection: section)
        methodSectionVC.delegate = MethodSectionDelegate(methodSection: section,
                                                         executor: methodExecutor)
        methodSectionVC.title = section.name
    }

}
