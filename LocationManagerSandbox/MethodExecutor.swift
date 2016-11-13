import CoreLocation

class MethodExecutor {

    enum MethodEnum {
        case requestWhenInUseAuthorization
        case requestAlwaysAuthorization
        case authorizationStatus
        case locationServicesEnabled
        case startUpdatingLocation
        case stopUpdatingLocation
        case requestLocation
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
        case .stopUpdatingLocation: stopUpdatingLocation()
        case .requestLocation: requestLocation()
        }
    }
    
}

fileprivate extension MethodExecutor {

    func requestWhenInUseAuthorization() {
        locationManager.requestWhenInUseAuthorization()
        logData.newEntry(.requestWhenInUseAuthorization)
    }
    
    func requestAlwaysAuthorization() {
        locationManager.requestAlwaysAuthorization()
        logData.newEntry(.requestAlwaysAuthorization)
    }

    func authorizationStatus() {
        let status = CLLocationManager.authorizationStatus()
        logData.newEntry(.authorizationStatus(status))
    }

    func locationServicesEnabled() {
        let enabled = CLLocationManager.locationServicesEnabled()
        logData.newEntry(.locationServicesEnabled(enabled))
    }

    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
        logData.newEntry(.startUpdatingLocation)
    }

    func stopUpdatingLocation() {
        locationManager.stopUpdatingLocation()
        logData.newEntry(.stopUpdatingLocation)
    }

    func requestLocation() {
        locationManager.requestLocation()
        logData.newEntry(.requestLocation)
    }
    
}
