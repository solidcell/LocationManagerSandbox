import UIKit

class MethodsDataSource: NSObject, UITableViewDataSource {

    let authorizationSection = [
        "a", "b"
    ]

    let sections: [[String]]

    override init() {
        self.sections = [authorizationSection]
        super.init()
    }

    static let cellIdentifier = "MethodTableViewCellIdentifier"
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MethodsDataSource.cellIdentifier,
                                                 for: indexPath)
        cell.textLabel?.text = sections[indexPath.section][indexPath.row]
        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].count
    }
    
}
