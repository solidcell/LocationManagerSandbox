import UIKit

class MethodsDelegate: NSObject, UITableViewDelegate {

    let data: MethodsData

    init(data: MethodsData) {
        self.data = data
        super.init()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(data.methodItem(at: indexPath))
    }
    
}
