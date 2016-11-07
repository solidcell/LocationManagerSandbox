import CoreLocation

class LocationManagerDelegate: NSObject, CLLocationManagerDelegate {

    let logData: LogData

    init(logData: LogData) {
        self.logData = logData
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        logData.newEntry("locationManager(_:didChangeAuthorization:) with \(status)")
    }

}
