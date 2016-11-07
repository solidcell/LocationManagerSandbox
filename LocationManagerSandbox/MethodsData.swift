import UIKit

class MethodsData {

    struct MethodSection {
        let name: String
        let items: [MethodItem]
    }

    struct MethodItem {
        let name: String
        let method: MethodEnum
    }

    private let authorizationSection = MethodSection(name: "Authorization",
                                                     items: [
                                                        MethodItem(name: "asdf", method: .something),
                                                        MethodItem(name: "foo", method: .request)])

    let sections: [MethodSection]

    init() {
        self.sections = [authorizationSection]
    }

    func methodSection(at index: Int) -> MethodSection {
        return sections[index]
    }

    func methodItems(at index: Int) -> [MethodItem] {
        return methodSection(at: index).items
    }

    func methodItem(at indexPath: IndexPath) -> MethodItem {
        return methodItems(at: indexPath.section)[indexPath.row]
    }
    
}
