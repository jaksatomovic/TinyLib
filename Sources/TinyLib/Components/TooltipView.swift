import SwiftUI

public extension View {
    /// Overlays this view with a view that provides a toolTip with the given string.
    func toolTip(_ toolTip: String?, isVisible: Bool) -> some View {
        modifier(ToolTip(toolTip: toolTip, isVisible: isVisible))
    }
}

public struct ToolTip: ViewModifier {
    public init(toolTip: String?, isVisible: Bool) {
        self.toolTip = toolTip
        self.isVisible = isVisible
    }

    public let toolTip: String?
    public let isVisible: Bool

    public func body(content: Content) -> some View {
        content
            .overlay(Group {
                if isVisible {
                    toolTip.map {
                        Text($0)
                            .secondaryDisplayText()
                            .fixedSize()
                            .padding(4)
                            .padding(.horizontal, 4)
                            .background(Color.controlBackground)
                            .cornerRadius(2)
                            .position(x: 0, y: -15)
                            .zIndex(1)
                    }
                } else {
                    EmptyView()
                }
            })
    }
}
