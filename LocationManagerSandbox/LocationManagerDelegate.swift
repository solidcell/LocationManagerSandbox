import CoreLocation

class LocationManagerDelegate: NSObject, CLLocationManagerDelegate {

    let logData: LogData

    init(logData: LogData) {
        self.logData = logData
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        logData.newEntry(.didChangeAuthorization(String(describing: status)))
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        logData.newEntry(.didUpdateLocations(String(describing: locations)))
    }

}
