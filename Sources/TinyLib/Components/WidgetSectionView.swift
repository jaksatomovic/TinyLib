import SwiftUI

public struct WidgetSectionView: View {
    public init(title: String, value: String) {
        self.title = title
        self.value = value
    }

    public var title: String
    public var value: String

    public var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(title)
                .font(.system(size: 10, weight: .semibold))
                .foregroundColor(.thirdary)
            Text(value)
                .font(.system(size: 11, weight: .bold))
                .foregroundColor(.secondary)
        }
    }
}
