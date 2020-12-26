import AppKit

public extension NSRunningApplication {
    var canBeActivated: Bool {
        activationPolicy == .regular || activationPolicy == .accessory
    }
}
