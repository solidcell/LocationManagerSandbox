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
            let distanceData = [PrettyLocationDistance(kCLDistanceFilterNone),
                                PrettyLocationDistance(CLLocationDistanceMax),
                                PrettyLocationDistance(1.0)]
            let timeoutData = [PrettyTimeInterval(CLTimeIntervalMax),
                               PrettyTimeInterval(1),
                               PrettyTimeInterval(5),
                               PrettyTimeInterval(15),
                               PrettyTimeInterval(30),
                               PrettyTimeInterval(60),
                               PrettyTimeInterval(180),
                               PrettyTimeInterval(600),
                               PrettyTimeInterval(1800)]
            inputRetriever.inputFrom(data: [distanceData, timeoutData],
                                     dataSelected: { [weak executor] items in
                                        // figure out a better way to keep type info
                                        let distance = distanceData[items[0]].distance
                                        let timeout = timeoutData[items[1]].timeInterval
                                        executor?.allowDeferredLocationUpdates(distance: distance,
                                                                               timeout: timeout)
            })
        }
    }
    
}
