import UIKit

class LogDataSource: NSObject, UITableViewDataSource {

    static let cellIdentifier = "LogTableViewCellIdentifier"

    private let logData: LogData

    init(logData: LogData) {
        self.logData = logData
        super.init()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LogDataSource.cellIdentifier,
                                                 for: indexPath)
        cell.textLabel?.text = logData.logs[indexPath.row]
        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return logData.logs.count
    }
    
}
