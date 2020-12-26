import Cocoa

public extension NSMenuItem {
    static func forDisplay(with text: String) -> NSMenuItem {
        let item = NSMenuItem(title: text, action: nil, keyEquivalent: "")
        item.isEnabled = false
        return item
    }
}
