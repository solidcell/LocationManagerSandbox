import UIKit

class MethodsData {

    struct MethodSection {
        let name: String
        let items: [MethodEnum]
    }

    private let authorizationSection = MethodSection(name: "Authorization",
                                                     items: [.requestWhenInUseAuthorization,
                                                             .requestAlwaysAuthorization])
    
    private let availabilitySection = MethodSection(name: "Availability",
                                                    items: [.authorizationStatus,
                                                            .locationServicesEnabled])
    
    private let standardLocationUpdatesSection = MethodSection(name: "Standard Location Updates",
                                                               items: [.startUpdatingLocation])

    let sections: [MethodSection]

    init() {
        self.sections = [authorizationSection,
                         availabilitySection,
                         standardLocationUpdatesSection]
    }

    func methodSection(at index: Int) -> MethodSection {
        return sections[index]
    }

    func methodEnums(at index: Int) -> [MethodEnum] {
        return methodSection(at: index).items
    }

    func methodItem(at indexPath: IndexPath) -> MethodEnum {
        return methodEnums(at: indexPath.section)[indexPath.row]
    }
    
}
