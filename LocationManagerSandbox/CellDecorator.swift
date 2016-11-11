import UIKit
import CoreLocation

class CellDecorator {

    func decorate(_ cell: LogCell, logEntry: LogEntry) {
        let timestamp = logEntry.timestamp.formatted
        switch logEntry.method {
        // App Delegate
        case .didFinishLaunchingWithOptions(let launchOptions):
            let details = launchOptions?.flatMap { "\($0): \($1)" } ?? []
            cell.decorate(title: "application(_:didFinishLaunchingWithOptions:)",
                          timestamp: timestamp,
                          details: details)
        case .applicationDidEnterBackground:
            cell.decorate(title: "applicationDidEnterBackground(_:)",
                          timestamp: timestamp)
        case .applicationWillResignActive:
            cell.decorate(title: "applicationWillResignActive(_:)",
                          timestamp: timestamp)
        case .applicationWillEnterForeground:
            cell.decorate(title: "applicationWillEnterForeground(_:)",
                          timestamp: timestamp)
        case .applicationDidBecomeActive:
            cell.decorate(title: "applicationDidBecomeActive(_:)",
                          timestamp: timestamp)
        case .applicationWillTerminate:
            cell.decorate(title: "applicationWillTerminate(_:)",
                          timestamp: timestamp)
        // Location Manager
        case .requestWhenInUseAuthorization:
            cell.decorate(title: "requestWhenInUseAuthorization()",
                          timestamp: timestamp)
        case .requestAlwaysAuthorization:
            cell.decorate(title: "requestAlwaysAuthorization()",
                          timestamp: timestamp)
        case .authorizationStatus(let status):
            cell.decorate(title: "authorizationStatus()",
                          timestamp: timestamp,
                          detail: status,
                          detailColor: status.color)
        case .locationServicesEnabled(let isEnabled):
            cell.decorate(title: "locationServicesEnabled()",
                          timestamp: timestamp,
                          detail: isEnabled,
                          detailColor: isEnabled.color)
        case .startUpdatingLocation:
            cell.decorate(title: "startUpdatingLocation()",
                          timestamp: timestamp)
        case .stopUpdatingLocation:
            cell.decorate(title: "stopUpdatingLocation()",
                          timestamp: timestamp)
        // Location Manager Delegate
        case .didUpdateLocations(let locations):
            cell.decorate(title: "locationManager(_:didUpdateLocations:)",
                          timestamp: timestamp,
                          details: locations)
        case .didChangeAuthorization(let status):
            cell.decorate(title: "locationManager(_:didChangeAuthorization:)",
                          timestamp: timestamp,
                          detail: status,
                          detailColor: status.color)
        }
    }

}

private var dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm:ss"
    return dateFormatter
}()

extension Date {

    var formatted: String {
        return dateFormatter.string(from: self)
    }
    
}

extension CLLocation {

    override open var description: String {
        return "\(coordinate)(\(horizontalAccuracy)) \(timestamp.formatted) \(altitude)(\(verticalAccuracy)) s\(speed) c\(course)"
    }
    
}

extension CLLocationCoordinate2D: CustomStringConvertible {

    public var description: String {
        return "\(latitude),\(longitude)"
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
