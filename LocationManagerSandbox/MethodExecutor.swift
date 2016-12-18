import CoreLocation

class MethodExecutor {

    enum ActionEnum {
        case requestWhenInUseAuthorization
        case requestAlwaysAuthorization
        case authorizationStatus
        case locationServicesEnabled
        case startUpdatingLocation
        case stopUpdatingLocation
        case requestLocation
    }

    enum BoolEnum {
        case pausesLocationUpdatesAutomatically
    }

    enum LocationDistanceEnum {
        case distanceFilter
    }

    fileprivate let locationManager: CLLocationManager
    fileprivate let logData: LogData

    init(locationManager: CLLocationManager,
         logData: LogData) {
        self.locationManager = locationManager
        self.logData = logData
    }

}

extension MethodExecutor {

    var activityType: CLActivityType {
        return locationManager.activityType
    }

    func activityTypeLog() {
        logData.newEntry(.activityTypeGet(activityType))
    }

    func activityTypeSet(_ value: CLActivityType) {
        locationManager.activityType = value
        logData.newEntry(.activityTypeSet(activityType))
    }

}

extension MethodExecutor {

    func allowDeferredLocationUpdates(distance: CLLocationDistance, timeout: TimeInterval) {
        logData.newEntry(.allowDeferredLocationUpdates(distance, timeout))
        locationManager.allowDeferredLocationUpdates(untilTraveled: distance, timeout: timeout)
    }

}

extension MethodExecutor {

    func execute(_ method: ActionEnum) {
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

    private func requestWhenInUseAuthorization() {
        locationManager.requestWhenInUseAuthorization()
        logData.newEntry(.requestWhenInUseAuthorization)
    }

    private func requestAlwaysAuthorization() {
        locationManager.requestAlwaysAuthorization()
        logData.newEntry(.requestAlwaysAuthorization)
    }

    private func authorizationStatus() {
        let status = CLLocationManager.authorizationStatus()
        logData.newEntry(.authorizationStatus(status))
    }

    private func locationServicesEnabled() {
        let enabled = CLLocationManager.locationServicesEnabled()
        logData.newEntry(.locationServicesEnabled(enabled))
    }

    private func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
        logData.newEntry(.startUpdatingLocation)
    }

    private func stopUpdatingLocation() {
        locationManager.stopUpdatingLocation()
        logData.newEntry(.stopUpdatingLocation)
    }

    private func requestLocation() {
        locationManager.requestLocation()
        logData.newEntry(.requestLocation)
    }

}

extension MethodExecutor {

    func set(_ boolean: BoolEnum, _ value: Bool) {
        switch boolean {
        case .pausesLocationUpdatesAutomatically: return pausesLocationUpdatesAutomaticallySet(value)
        }
    }

    func get(_ boolean: BoolEnum) -> Bool {
        switch boolean {
        case .pausesLocationUpdatesAutomatically: return pausesLocationUpdatesAutomatically
        }
    }

    func log(_ boolean: BoolEnum) {
        switch boolean {
        case .pausesLocationUpdatesAutomatically: return pausesLocationUpdatesAutomaticallyLog()
        }
    }

    private var pausesLocationUpdatesAutomatically: Bool {
        return locationManager.pausesLocationUpdatesAutomatically
    }

    private func pausesLocationUpdatesAutomaticallyLog() {
        logData.newEntry(.pausesLocationUpdatesAutomaticallyGet(pausesLocationUpdatesAutomatically))
    }

    private func pausesLocationUpdatesAutomaticallySet(_ value: Bool) {
        locationManager.pausesLocationUpdatesAutomatically = value
        logData.newEntry(.pausesLocationUpdatesAutomaticallySet(value))
    }

}

extension MethodExecutor {

    func set(_ locationDistance: LocationDistanceEnum, _ value: CLLocationDistance) {
        switch locationDistance {
        case .distanceFilter: return distanceFilterSet(value)
        }
    }

    func get(_ locationDistance: LocationDistanceEnum) -> CLLocationDistance {
        switch locationDistance {
        case .distanceFilter: return distanceFilter
        }
    }

    func log(_ locationDistance: LocationDistanceEnum) {
        switch locationDistance {
        case .distanceFilter: return distanceFilterLog()
        }
    }

    private var distanceFilter: CLLocationDistance {
        return locationManager.distanceFilter
    }

    private func distanceFilterLog() {
        logData.newEntry(.distanceFilterGet(distanceFilter))
    }

    private func distanceFilterSet(_ value: CLLocationDistance) {
        locationManager.distanceFilter = value
        logData.newEntry(.distanceFilterSet(value))
    }
    
}
