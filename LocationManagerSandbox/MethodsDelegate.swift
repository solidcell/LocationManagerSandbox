import UIKit

class MethodsDelegate: NSObject, UITableViewDelegate {

    let data: MethodsData
    let executor: MethodExecutor

    init(data: MethodsData,
         executor: MethodExecutor) {
        self.data = data
        self.executor = executor
        super.init()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let method = data.methodItem(at: indexPath).method
        executor.execute(method)
    }
    
}
