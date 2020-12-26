import SwiftUI

public extension Preference {
    enum Section: String, Identifiable, CaseIterable {
        case general
        case components
        case menuView

        public var id: String {
            rawValue
        }

        var localizedDescription: String {
            switch self {
            case .general:
                return "ui.general".localized()
            case .components:
                return "ui.components".localized()
            case .menuView:
                return "ui.menu_view".localized()
            }
        }
    }

    struct PreferenceSectionView: View {
        @Binding public var activeSection: Section
        public let section: Section

        var isActive: Bool {
            activeSection == section
        }

        public var body: some View {
            HStack(spacing: 8) {
                Text(section.localizedDescription)
                    .inlineSection()
                Spacer()
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 12)
            .background(isActive ? Color.separator : Color.clear)
            .cornerRadius(4)
            .contentShape(Rectangle())
            .onTapGesture {
                activeSection = section
            }
        }
    }
}
