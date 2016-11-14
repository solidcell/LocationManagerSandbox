import UIKit

class MethodSectionDataSource: NSObject, UITableViewDataSource {
    
    var methodSection: MethodsData.MethodSection
    var executor: MethodExecutor
    private static let actionCellIdentifier = "ActionCellIdentifier"
    private static let setGetCellIdentifier = "SetGetCellIdentifier"

    init(methodSection: MethodsData.MethodSection,
         executor: MethodExecutor) {
        self.methodSection = methodSection
        self.executor = executor
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return methodSection.items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let methodItem = methodSection.items[indexPath.row]
        switch methodItem {
        case .action(let method):
            let cell = tableView.dequeueReusableCell(withIdentifier: MethodSectionDataSource.actionCellIdentifier,
                                                     for: indexPath)
            cell.textLabel?.text = String(describing: method)
            return cell
        case .setGet(let variable):
            let cell = tableView.dequeueReusableCell(withIdentifier: MethodSectionDataSource.setGetCellIdentifier,
                                                     for: indexPath) as! SetGetTableViewCell
            cell.titleLabel.text = String(describing: variable)
            cell.getValue = { [weak executor] in executor?.value(variable) }
            cell.switchCallback = { [weak executor] in executor?.set(variable, value: $0) }
            return cell
        }
    }

}
