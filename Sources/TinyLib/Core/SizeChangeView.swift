import SwiftUI

public typealias SizeChange = ((CGSize) -> Void)?

public typealias SizeChangeViewBuilder = (SizeChange) -> AnyView

public protocol SizeChangeView: View {
    var onSizeChange: SizeChange { get }
    func reportSize(_ geometry: GeometryProxy) -> AnyView
}

public extension SizeChangeView {
    func reportSize(_ geometry: GeometryProxy) -> AnyView {
        AnyView(
            Color.clear.preference(
                key: SizePreferenceKey.self,
                value: [geometry.size]
            )
        )
    }
}
