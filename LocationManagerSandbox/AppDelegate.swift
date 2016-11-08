import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var logData: LogData?

    enum MethodEnum {
        case didFinishLaunchingWithOptions
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let viewController = window?.rootViewController as! ViewController
        logData = viewController.logData
        
        let entry = LogEntry(method: .app(.didFinishLaunchingWithOptions),
                             value: String(describing: launchOptions))
        logData?.newEntry(entry)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }


}

