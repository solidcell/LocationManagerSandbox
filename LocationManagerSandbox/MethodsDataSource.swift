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
        cell.textLabel?.text = String(describing: data.methodItem(at: indexPath))
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return data.methodSection(at: section).name
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return data.sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.methodEnums(at: section).count
    }
    
}
