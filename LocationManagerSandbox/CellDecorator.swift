import UIKit
import CoreLocation

class CellDecorator {

    func decorate(_ cell: LogCell, logEntry: LogEntry) {
        switch logEntry {
        case .didFinishLaunchingWithOptions(let launchOptions):
            let details = launchOptions?.flatMap { "\($0): \($1)" } ?? []
            cell.decorate(title: "application(_:didFinishLaunchingWithOptions:)",
                          details: details)
        case .requestWhenInUseAuthorization(let date):
            cell.decorate(title: "requestWhenInUseAuthorization()",
                          detail: date)
        case .didChangeAuthorization(let status):
            cell.decorate(title: "locationManager(_:didChangeAuthorization:)",
                          detail: status,
                          detailColor: status.color)
        case .didUpdateLocations(let locations):
            cell.decorate(title: "locationManager(_:didUpdateLocations:)",
                          details: locations)
        case .authorizationStatus(let status):
            cell.decorate(title: "authorizationStatus()",
                          detail: status,
                          detailColor: status.color)
        case .locationServicesEnabled(let isEnabled):
            cell.decorate(title: "locationServicesEnabled()",
                          detail: isEnabled,
                          detailColor: isEnabled.color)
        case .startUpdatingLocation(let date):
            cell.decorate(title: "startUpdatingLocation()",
                          detail: date)
        case .requestAlwaysAuthorization(let date):
            cell.decorate(title: "requestAlwaysAuthorization()",
                          detail: date)
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
