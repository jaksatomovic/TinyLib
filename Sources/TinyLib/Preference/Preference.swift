import SwiftUI

public struct Preference {
    public enum TextDisplay: String, StringEnum {
        case compact
        case singleLine

        public var description: String {
            switch self {
            case .compact:
                return "text_display.compact".localized()
            case .singleLine:
                return "text_display.single_line".localized()
            }
        }
    }

    public enum FontDesign: String, StringEnum {
        case `default`
        case monospaced

        public var value: Font.Design {
            switch self {
            case .default:
                return .default
            case .monospaced:
                return .monospaced
            }
        }

        public var description: String {
            switch self {
            case .default:
                return "font_design.default".localized()
            case .monospaced:
                return "font_design.monospaced".localized()
            }
        }
    }
}
