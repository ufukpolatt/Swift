import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window:NSWindowController!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    @IBAction func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
        window.close()
    }


}
