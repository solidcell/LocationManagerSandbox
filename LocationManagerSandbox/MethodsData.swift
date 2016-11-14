import UIKit

class MethodsData {

    struct MethodSection {
        let name: String
        let items: [MethodItem]
    }

    enum MethodItem {
        case action(MethodExecutor.MethodEnum)
        case setGet(MethodExecutor.BoolEnum)
    }

    private let authorizationSection =
        MethodSection(name: "Authorization",
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
                              .setGet(.pausesLocationUpdatesAutomatically)])

    let sections: [MethodSection]

    init() {
        self.sections = [authorizationSection,
                         availabilitySection,
                         standardLocationUpdatesSection]
    }

}
