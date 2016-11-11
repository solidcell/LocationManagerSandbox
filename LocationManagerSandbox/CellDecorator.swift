import UIKit
import CoreLocation

class CellDecorator {

    func decorate(_ cell: LogCell, logEntry: LogEntry) {
        switch logEntry {
        case .didFinishLaunchingWithOptions(let launchOptions):
            cell.decorate(title: "application(_:didFinishLaunchingWithOptions:)",
                          details: [String(describing: launchOptions)])
        case .didChangeAuthorization(let status):
            cell.decorate(title: "locationManager(_:didChangeAuthorization:)",
                          details: [String(describing: status)],
                          detailsColor: status.color)
        case .didUpdateLocations(let locations):
            cell.decorate(title: "locationManager(_:didUpdateLocations:)",
                          details: [String(describing: locations)])
        case .authorizationStatus(let status):
            cell.decorate(title: "authorizationStatus",
                          details: [String(describing: status)],
                          detailsColor: status.color)
        case .locationServicesEnabled(let isEnabled):
            cell.decorate(title: "locationServicesEnabled",
                          details: [isEnabled.description],
                          detailsColor: isEnabled ? UIColor.green : UIColor.red)
        }
    }

}

private extension CLAuthorizationStatus {

    private var good: UIColor { return UIColor(rgb: 0x67AD65) }
    private var bad: UIColor { return UIColor(rgb: 0xC94D3F) }
    private var neutral: UIColor { return UIColor.black }

    var color: UIColor {
        switch self {
        case .notDetermined: return neutral
        case .authorizedAlways: return good
        case .authorizedWhenInUse: return good
        case .denied: return bad
        case .restricted: return bad
        }
    }
    
}
