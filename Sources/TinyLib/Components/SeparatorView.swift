import SwiftUI

public struct SeparatorView: View {
    public init(padding: CGFloat = 4) {
        self.padding = padding
    }

    public var padding: CGFloat = 4

    public var body: some View {
        Rectangle()
            .fill(Color.separator)
            .frame(height: 1)
            .padding(.vertical, padding)
    }
}
