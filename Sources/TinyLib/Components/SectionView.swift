import SwiftUI

public struct SectionView<Content: View>: View {
    public init(title: String, content: @escaping () -> Content) {
        self.title = title
        self.content = content
    }

    public let title: String
    public let content: () -> Content

    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .section()
            content()
        }
    }
}
