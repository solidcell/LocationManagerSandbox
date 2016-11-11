import UIKit
import CoreLocation

enum LogEntry {
    // App Delegate
    case didFinishLaunchingWithOptions([UIApplicationLaunchOptionsKey: Any]?)
    case applicationDidEnterBackground
    case applicationWillResignActive
    case applicationWillEnterForeground
    case applicationDidBecomeActive
    case applicationWillTerminate
    
    // Location Manager
        // Requesting Authorization for Location Services
    case requestWhenInUseAuthorization(Date)
    case requestAlwaysAuthorization(Date)
        // Determining the Availability of Services
    case authorizationStatus(CLAuthorizationStatus)
    case locationServicesEnabled(Bool)
        // Initiating Standard Location Updates
    case startUpdatingLocation(Date)
    case stopUpdatingLocation(Date)
    
    // Location Manager Delegate
    case didUpdateLocations([CLLocation])
    case didChangeAuthorization(CLAuthorizationStatus)
}

class LogData {

    weak var delegate: LogDataDelegate?
    private(set) var logs = [LogEntry]()

    func newEntry(_ entry: LogEntry) {
        logs.append(entry)
        delegate?.didAddEntry(at: logs.count - 1)
    }

}

protocol LogDataDelegate: class {
    func didAddEntry(at index: Int)
}
