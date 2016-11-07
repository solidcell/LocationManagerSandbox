import UIKit

class MethodsDataSource: NSObject, UITableViewDataSource {

    let data: MethodsData

    init(data: MethodsData) {
        self.data = data
        super.init()
    }

    static let cellIdentifier = "MethodTableViewCellIdentifier"
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MethodsDataSource.cellIdentifier,
                                                 for: indexPath)
        cell.textLabel?.text = data.methodItem(at: indexPath).name
        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return data.sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.methodItems(at: section).count
    }
    
}
