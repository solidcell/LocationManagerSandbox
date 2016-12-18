import UIKit
import CoreLocation

class MethodSectionDelegate: NSObject, UITableViewDelegate {

    let methodSection: MethodsData.MethodSection
    let executor: MethodExecutor
    var inputRetriever: InputRetriever!

    init(methodSection: MethodsData.MethodSection,
         executor: MethodExecutor) {
        self.methodSection = methodSection
        self.executor = executor
        super.init()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let methodItem = methodSection.items[indexPath.row]
        switch methodItem {
        case .action(let action): executor.execute(action)
        case .boolean(let boolean): executor.log(boolean)
        case .locationDistance(let locationDistance): executor.log(locationDistance)
        case .allowDeferredLocationUpdates:
            let dataSource = DeferredUpdatedDataSource(executor: executor)
            inputRetriever.inputFrom(dataSource: dataSource)
        case .activityType: executor.activityTypeLog()
        }
    }
    
}
