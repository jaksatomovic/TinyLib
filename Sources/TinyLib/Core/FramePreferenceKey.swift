import SwiftUI

public struct FramePreferenceData: Equatable {
    let index: Int
    let frame: CGRect
}

public struct FramePreferenceKey: PreferenceKey {
    public typealias Value = [FramePreferenceData]

    public static var defaultValue: [FramePreferenceData] = []

    public static func reduce(value: inout [FramePreferenceData], nextValue: () -> [FramePreferenceData]) {
        value += nextValue()
    }
}
