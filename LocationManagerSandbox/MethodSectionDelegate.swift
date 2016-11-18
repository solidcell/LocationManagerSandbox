import UIKit

class MethodSectionDelegate: NSObject, UITableViewDelegate {

    let methodSection: MethodsData.MethodSection
    let executor: MethodExecutor

    init(methodSection: MethodsData.MethodSection,
         executor: MethodExecutor) {
        self.methodSection = methodSection
        self.executor = executor
        super.init()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let methodItem = methodSection.items[indexPath.row]
        switch methodItem {
        case .method(let method): executor.execute(method)
        case .boolean(let boolean): executor.log(boolean)
        }
    }
    
}
