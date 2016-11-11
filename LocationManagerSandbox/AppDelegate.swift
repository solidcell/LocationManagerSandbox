import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var logData: LogData!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let viewController = window?.rootViewController as! ViewController
        logData = viewController.logData
        
        logData.newEntry(.didFinishLaunchingWithOptions(launchOptions))
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        logData.newEntry(.applicationWillResignActive)
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        logData.newEntry(.applicationDidEnterBackground)
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        logData.newEntry(.applicationWillEnterForeground)
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        logData.newEntry(.applicationDidBecomeActive)
    }

    func applicationWillTerminate(_ application: UIApplication) {
        logData.newEntry(.applicationWillTerminate)
    }


}

