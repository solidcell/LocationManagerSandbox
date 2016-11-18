import UIKit
import CoreLocation

struct LogEntry {
    let timestamp: Date
    let method: LogMethod

    init(_ method: LogMethod) {
        self.timestamp = Date()
        self.method = method
    }
}

enum LogMethod {
    // App Delegate
    case didFinishLaunchingWithOptions([UIApplicationLaunchOptionsKey: Any]?)
    case applicationDidEnterBackground
    case applicationWillResignActive
    case applicationWillEnterForeground
    case applicationDidBecomeActive
    case applicationWillTerminate
    
    // Location Manager
        // Requesting Authorization for Location Services
    case requestWhenInUseAuthorization
    case requestAlwaysAuthorization
        // Determining the Availability of Services
    case authorizationStatus(CLAuthorizationStatus)
    case locationServicesEnabled(Bool)
        // Initiating Standard Location Updates
    case startUpdatingLocation
    case stopUpdatingLocation
    case requestLocation
    case pausesLocationUpdatesAutomaticallySet(Bool)
    case pausesLocationUpdatesAutomaticallyGet(Bool)
    case distanceFilterGet(CLLocationDistance)
    case distanceFilterSet(CLLocationDistance)
    
    // Location Manager Delegate
    case didUpdateLocations([CLLocation])
    case didFailWithError(Error)
    case didChangeAuthorization(CLAuthorizationStatus)
}

class LogData {

    weak var delegate: LogDataDelegate?
    private(set) var logs = [LogEntry]()

    func newEntry(_ method: LogMethod) {
        let entry = LogEntry(method)
        logs.append(entry)
        delegate?.didAddEntry(at: logs.count - 1)
    }

}

protocol LogDataDelegate: class {
    func didAddEntry(at index: Int)
}
