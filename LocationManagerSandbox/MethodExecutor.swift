import CoreLocation

class MethodExecutor {

    enum MethodEnum {
        case requestWhenInUseAuthorization
        case requestAlwaysAuthorization
        case authorizationStatus
        case locationServicesEnabled
        case startUpdatingLocation
    }

    fileprivate let locationManager: CLLocationManager
    fileprivate let logData: LogData

    init(locationManager: CLLocationManager,
         logData: LogData) {
        self.locationManager = locationManager
        self.logData = logData
    }

    func execute(_ method: MethodEnum) {
        switch method {
        case .requestWhenInUseAuthorization: requestWhenInUseAuthorization()
        case .requestAlwaysAuthorization: requestAlwaysAuthorization()
        case .authorizationStatus: authorizationStatus()
        case .locationServicesEnabled: locationServicesEnabled()
        case .startUpdatingLocation: startUpdatingLocation()
        }
    }
    
}

fileprivate extension MethodExecutor {

    func requestWhenInUseAuthorization() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func requestAlwaysAuthorization() {
        locationManager.requestAlwaysAuthorization()
    }

    func authorizationStatus() {
        let status = CLLocationManager.authorizationStatus()
        logData.newEntry(.authorizationStatus(status.description))
    }

    func locationServicesEnabled() {
        let enabled = CLLocationManager.locationServicesEnabled()
        logData.newEntry(.locationServicesEnabled(String(describing: enabled)))
    }

    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }
    
}
