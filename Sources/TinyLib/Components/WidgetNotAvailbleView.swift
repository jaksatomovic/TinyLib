import SwiftUI

public struct WidgetNotAvailbleView: View {
    public init(text: String = "N/A") {
        self.text = text
    }

    public var text = "N/A"

    public var body: some View {
        Text(text)
            .inlineSection()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.controlBackground.opacity(0.98))
    }
}
