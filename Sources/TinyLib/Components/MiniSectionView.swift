import SwiftUI

public struct MiniSectionView: View {
    var title: String
    var value: String

    public var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(title.localized())
                .miniSection()
            Text(value)
                .displayText()
        }
    }
}
