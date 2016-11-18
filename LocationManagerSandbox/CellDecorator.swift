import UIKit
import CoreLocation

class CellDecorator {

    func decorate(_ cell: LogCell, logEntry: LogEntry) {
        cell.decorate(timestamp: logEntry.timestamp.formatted)
        switch logEntry.method {
        // App Delegate
        case .didFinishLaunchingWithOptions(let launchOptions):
            let details = launchOptions?.flatMap { "\($0): \($1)" } ?? []
            cell.decorate(title: "application(_:didFinishLaunchingWithOptions:)",
                          details: details)
        case .applicationDidEnterBackground:
            cell.decorate(title: "applicationDidEnterBackground(_:)")
        case .applicationWillResignActive:
            cell.decorate(title: "applicationWillResignActive(_:)")
        case .applicationWillEnterForeground:
            cell.decorate(title: "applicationWillEnterForeground(_:)")
        case .applicationDidBecomeActive:
            cell.decorate(title: "applicationDidBecomeActive(_:)")
        case .applicationWillTerminate:
            cell.decorate(title: "applicationWillTerminate(_:)")
        // Location Manager
        case .requestWhenInUseAuthorization:
            cell.decorate(title: "requestWhenInUseAuthorization()")
        case .requestAlwaysAuthorization:
            cell.decorate(title: "requestAlwaysAuthorization()")
        case .authorizationStatus(let status):
            cell.decorate(title: "authorizationStatus()",
                          detail: status,
                          detailColor: status.color)
        case .locationServicesEnabled(let isEnabled):
            cell.decorate(title: "locationServicesEnabled()",
                          detail: isEnabled,
                          detailColor: isEnabled.color)
        case .startUpdatingLocation:
            cell.decorate(title: "startUpdatingLocation()")
        case .stopUpdatingLocation:
            cell.decorate(title: "stopUpdatingLocation()")
        case .requestLocation:
            cell.decorate(title: "requestLocation()")
        case .pausesLocationUpdatesAutomaticallySet(let pauses):
            cell.decorate(title: "pausesLocationUpdatesAutomatically =",
                          detail: pauses)
        case .pausesLocationUpdatesAutomaticallyGet(let pauses):
            cell.decorate(title: "pausesLocationUpdatesAutomatically",
                          detail: pauses)
        case .distanceFilterSet(let value):
            cell.decorate(title: "distanceFilter =",
                          detail: value)
        case .distanceFilterGet(let value):
            cell.decorate(title: "distanceFilter",
                          detail: value)
        // Location Manager Delegate
        case .didUpdateLocations(let locations):
            cell.decorate(title: "locationManager(_:didUpdateLocations:)",
                          details: locations)
        case .didFailWithError(let error):
            cell.decorate(title: "locationManager(_:didFailWithError:)",
                          detail: String(describing: error),
                          detailColor: UIColor.bad)
        case .didChangeAuthorization(let status):
            cell.decorate(title: "locationManager(_:didChangeAuthorization:)",
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
        return "\(coordinate)(\(horizontalAccuracy)) \(timestamp.formatted) a\(altitude)(\(verticalAccuracy)) s\(speed) c\(course)"
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
