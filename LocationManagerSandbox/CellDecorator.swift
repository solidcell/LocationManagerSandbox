import UIKit
import CoreLocation

class CellDecorator {

    func decorate(_ cell: LogCell, logEntry: LogEntry) {
        switch logEntry {
        case .didFinishLaunchingWithOptions(let launchOptions):
            let details = launchOptions == nil ? [] : [String(describing: launchOptions)]
            cell.decorate(title: "application(_:didFinishLaunchingWithOptions:)",
                          details: details)
        case .didChangeAuthorization(let status):
            cell.decorate(title: "locationManager(_:didChangeAuthorization:)",
                          details: [status],
                          detailsColor: status.color)
        case .didUpdateLocations(let locations):
            cell.decorate(title: "locationManager(_:didUpdateLocations:)",
                          details: locations)
        case .authorizationStatus(let status):
            cell.decorate(title: "authorizationStatus",
                          details: [status],
                          detailsColor: status.color)
        case .locationServicesEnabled(let isEnabled):
            cell.decorate(title: "locationServicesEnabled",
                          details: [isEnabled],
                          detailsColor: isEnabled.color)
        }
    }

}

private extension UIColor {

    class var good: UIColor { return UIColor(rgb: 0x67AD65) }
    class var bad: UIColor { return UIColor(rgb: 0xC94D3F) }
    class var neutral: UIColor { return UIColor.black }

}

private extension Bool {

    var color: UIColor {
        return self ? UIColor.good : UIColor.bad
    }
    
}

private extension CLAuthorizationStatus {

    var color: UIColor {
        switch self {
        case .notDetermined: return UIColor.neutral
        case .authorizedAlways: return UIColor.good
        case .authorizedWhenInUse: return UIColor.good
        case .denied: return UIColor.bad
        case .restricted: return UIColor.bad
        }
    }
    
}
