import UIKit
import CoreLocation

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
        case .method(let method):
            let cell = tableView.dequeueReusableCell(
                withIdentifier: MethodSectionDataSource.actionCellIdentifier,
                for: indexPath)
            cell.textLabel?.text = String(describing: method)
            return cell
        case .boolean(let boolean):
            let cell = tableView.dequeueReusableCell(withIdentifier: BooleanCell.cellIdentifier,
                                                     for: indexPath) as! BooleanCell
            cell.titleLabel.text = String(describing: boolean)
            cell.getValue = { [weak executor] in return executor?.get(boolean) }
            cell.switchCallback = { [weak executor] in executor?.set(boolean, $0) }
            return cell
        case .locationDistance(let locationDistance):
            let cell = tableView.dequeueReusableCell(withIdentifier: VariableCell.cellIdentifier,
                                                     for: indexPath) as! VariableCell
            cell.titleLabel.text = String(describing: locationDistance)
            let data = [[PrettyLocationDistance(kCLDistanceFilterNone),
                         PrettyLocationDistance(CLLocationDistanceMax),
                         PrettyLocationDistance(1.0)]]
            cell.inputData = data
            cell.dataSelected = { [weak executor] items in
                items.enumerated().forEach { executor?.set(locationDistance, data[$0][$1].distance) }
            }
            return cell
        }
    }

}
