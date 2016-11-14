import UIKit

class MethodSectionDataSource: NSObject, UITableViewDataSource {
    
    var methodSection: MethodsData.MethodSection
    private static let cellIdentifier = "MethodSectionTableViewCellIdentifier"

    init(methodSection: MethodsData.MethodSection) {
        self.methodSection = methodSection
    }

    func configure(for tableView: UITableView) {
        tableView.dataSource = self
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: MethodSectionDataSource.cellIdentifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return methodSection.items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MethodSectionDataSource.cellIdentifier,
                                                 for: indexPath)
        let methodItem = methodSection.items[indexPath.row]
        switch methodItem {
        case .action(let method):
            cell.textLabel?.text = String(describing: method)
        case .setGet(let variable):
            cell.textLabel?.text = String(describing: variable)
        }
        return cell
    }

}
