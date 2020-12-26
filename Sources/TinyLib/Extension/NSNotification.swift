import Foundation

public extension NSNotification.Name {
    static let AppShouldRefresh = NSNotification.Name("AppShouldRefresh")
    static let SMCShouldRefresh = NSNotification.Name("SMCShouldRefresh")
    static let StoreShouldRefresh = NSNotification.Name("StoreShouldRefresh")
    static let NetworkShouldRefresh = NSNotification.Name("NetworkShouldRefresh")
}
