import CoreLocation

class LocationManagerDelegate: NSObject, CLLocationManagerDelegate {

    let logData: LogData

    init(logData: LogData) {
        self.logData = logData
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        logData.newEntry("locationManager(_:didChangeAuthorization:) with \(status)")
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        logData.newEntry("locationManager(_:didUpdateLocations:) with \(locations)")
    }

}
