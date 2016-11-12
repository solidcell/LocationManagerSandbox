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
        cell.textLabel?.text = String(describing: methodSection.items[indexPath.row])
        return cell
    }

}
