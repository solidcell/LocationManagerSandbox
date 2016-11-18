import UIKit

class MethodsData {

    struct MethodSection {
        let name: String
        let items: [MethodItem]
    }

    enum MethodItem {
        case method(MethodExecutor.MethodEnum)
        case boolean(MethodExecutor.BoolEnum)
        case locationDistance(MethodExecutor.LocationDistanceEnum)
    }

    private let authorizationSection =
        MethodSection(name: "Authorization",
                      items: [.method(.requestWhenInUseAuthorization),
                              .method(.requestAlwaysAuthorization)])

    private let availabilitySection =
        MethodSection(name: "Availability",
                      items: [.method(.authorizationStatus),
                              .method(.locationServicesEnabled)])

    private let standardLocationUpdatesSection =
        MethodSection(name: "Standard Location Updates",
                      items: [.method(.startUpdatingLocation),
                              .method(.stopUpdatingLocation),
                              .method(.requestLocation),
                              .boolean(.pausesLocationUpdatesAutomatically),
                              .locationDistance(.distanceFilter)])

    let sections: [MethodSection]

    init() {
        self.sections = [authorizationSection,
                         availabilitySection,
                         standardLocationUpdatesSection]
    }

}
