import UIKit

class ViewController: UIViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let methodsVC = segue.destination as? MethodsTableViewController {
            prepare(methodsTableViewController: methodsVC)
        }
    }

    private func prepare(methodsTableViewController: MethodsTableViewController) {
        methodsTableViewController.methodExecutor = MethodExecutor()
    }

}
