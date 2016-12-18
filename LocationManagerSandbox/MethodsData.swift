import UIKit

class MethodsData {

    struct MethodSection {
        let name: String
        let items: [MethodItem]
    }

    enum MethodItem {
        case action(MethodExecutor.ActionEnum)
        case boolean(MethodExecutor.BoolEnum)
        case locationDistance(MethodExecutor.LocationDistanceEnum)
        case allowDeferredLocationUpdates
        case activityType
    }

    private let authorizationSection =
        MethodSection(name: "Authorization",
                      // TODO add a detail label to these which says
                      // note: Would crash if Info.plist did not have _____
                      items: [.action(.requestWhenInUseAuthorization),
                              .action(.requestAlwaysAuthorization)])

    private let availabilitySection =
        MethodSection(name: "Availability",
                      items: [.action(.authorizationStatus),
                              .action(.locationServicesEnabled)])

    private let standardLocationUpdatesSection =
        MethodSection(name: "Standard Location Updates",
                      items: [.action(.startUpdatingLocation),
                              .action(.stopUpdatingLocation),
                              .action(.requestLocation),
                              .boolean(.pausesLocationUpdatesAutomatically),
                              .locationDistance(.distanceFilter),
                              .activityType])

    private let deferringLocationUpdates =
        MethodSection(name: "Deferring Location Updates",
                      // TODO add a detail label which says
                      // note: Would crash if Info.plist did not have UIBackgroundModes=[location]
                      items: [.allowDeferredLocationUpdates])

    let sections: [MethodSection]

    init() {
        self.sections = [authorizationSection,
                         availabilitySection,
                         standardLocationUpdatesSection,
                         deferringLocationUpdates]
    }

}
