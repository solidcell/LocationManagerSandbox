import CoreLocation

class LocationManagerDelegate: NSObject, CLLocationManagerDelegate {

    let logData: LogData

    init(logData: LogData) {
        self.logData = logData
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        let entry = LogEntry(title: "locationManager(_:didChangeAuthorization:)",
                             subtitle: String(describing: status))
        logData.newEntry(entry)
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let entry = LogEntry(title: "locationManager(_:didUpdateLocations:)",
                             subtitle: String(describing: locations))
        logData.newEntry(entry)
    }

}
