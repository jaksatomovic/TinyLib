import Foundation

public protocol LocalizedStringConvertible {
    var localizedDescription: String { get }
}

public protocol LocalizedTextComponent: LocalizedStringConvertible, RawRepresentable where RawValue == String {}

public extension LocalizedTextComponent {
    var localizedDescription: String {
        "text_component.\(rawValue)".localized()
    }
}
