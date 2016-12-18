import UIKit

class MethodSectionDataSource: NSObject, UITableViewDataSource {

    var methodSection: MethodsData.MethodSection
    var executor: MethodExecutor
    private static let actionCellIdentifier = "ActionCellIdentifier"

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
        case .action(let action):
            let cell = tableView.dequeueReusableCell(withIdentifier: MethodSectionDataSource.actionCellIdentifier,
                                                     for: indexPath)
            cell.textLabel?.text = String(describing: action)
            return cell
        case .boolean(let boolean):
            let cell = tableView.dequeueReusableCell(withIdentifier: BooleanCell.cellIdentifier,
                                                     for: indexPath) as! BooleanCell
            cell.configure(executor: executor, boolean: boolean)
            return cell
        case .locationDistance(let locationDistance):
            let cell = tableView.dequeueReusableCell(withIdentifier: VariableCell.cellIdentifier,
                                                     for: indexPath) as! VariableCell
            let dataSource = LocationDistanceDataSource(executor: executor, locationDistance: locationDistance)
            let title = String(describing: locationDistance)
            cell.configure(dataSource: dataSource, title: title)
            return cell
        case .allowDeferredLocationUpdates:
            let cell = tableView.dequeueReusableCell(withIdentifier: MethodSectionDataSource.actionCellIdentifier,
                                                     for: indexPath)
            cell.textLabel?.text = String(describing: methodItem)
            return cell
        case .activityType:
            let cell = tableView.dequeueReusableCell(withIdentifier: VariableCell.cellIdentifier,
                                                     for: indexPath) as! VariableCell
            let dataSource = ActivityTypeDataSource(executor: executor)
            let title = String(describing: methodItem)
            cell.configure(dataSource: dataSource, title: title)
            return cell
        }
    }

}
