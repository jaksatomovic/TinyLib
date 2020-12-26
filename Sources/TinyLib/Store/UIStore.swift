import AppKit
import Foundation

public class UIStore: ObservableObject {
    @Published public var hoveringID: String?
    @Published public var menuWidth: CGFloat?
    @Published public var menuOpened = false
    @Published public var activeSection: Any?//: Preference.Section = .general
    
    public init() {}
    
    init(hoveringID: String?, menuWidth: CGFloat?,  menuOpened: Bool?) {
        self.hoveringID = hoveringID
        self.menuWidth = menuWidth
        self.menuOpened = menuOpened ?? false
    }
    
    init(hoveringID: String?, menuWidth: CGFloat?,  menuOpened: Bool?, activeSection: Any?) {
        self.hoveringID = hoveringID
        self.menuWidth = menuWidth
        self.menuOpened = menuOpened ?? false
        self.activeSection = activeSection
    }
}
