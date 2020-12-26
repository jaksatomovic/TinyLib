import SwiftUI

public extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)

        // swiftlint:disable:next identifier_name
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: Double(r) / 255, green: Double(g) / 255, blue: Double(b) / 255, opacity: Double(a) / 255)
    }

    private static var isDark: Bool { NSApp.effectiveAppearance.name == NSAppearance.Name.darkAqua }
    static let border = Color(NSColor.controlColor)
    static let menuBorder = Color(NSColor.separatorColor)
    static let controlBackground = Color(NSColor.controlBackgroundColor)
    static let text = Color(NSColor.textColor)
    static let textBackground = Color(NSColor.textBackgroundColor)
    static let info = Color(NSColor.disabledControlTextColor)
    static let shadow = Color(NSColor.shadowColor)
    static let separator = Color(NSColor.separatorColor)
    static let thirdary = Color.secondary.opacity(0.7)
}
