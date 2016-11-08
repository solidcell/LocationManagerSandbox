import CoreLocation

class LocationManagerDelegate: NSObject, CLLocationManagerDelegate {

    enum MethodEnum {
        case didChangeAuthorization
        case didUpdateLocations
    }

    let logData: LogData

    init(logData: LogData) {
        self.logData = logData
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        let entry = LogEntry(method: .delegate(.didChangeAuthorization),
                             value: String(describing: status))
        logData.newEntry(entry)
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let entry = LogEntry(method: .delegate(.didUpdateLocations),
                             value: String(describing: locations))
        logData.newEntry(entry)
    }

}
