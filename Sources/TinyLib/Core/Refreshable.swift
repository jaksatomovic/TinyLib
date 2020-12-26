import Foundation

@objc public protocol RefreshableObjC: AnyObject {
    func refresh()
}

public protocol Refreshable: RefreshableObjC {
    func initObserver(for name: NSNotification.Name)
}

public extension Refreshable {
    func initObserver(for name: NSNotification.Name) {
        NotificationCenter.default.addObserver(self, selector: #selector(refresh), name: name, object: nil)
    }
}
