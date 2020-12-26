import SwiftUI

public struct SizePreferenceKey: PreferenceKey {
    public typealias Value = [CGSize]

    public static var defaultValue: [CGSize] = []

    public static func reduce(value: inout [CGSize], nextValue: () -> [CGSize]) {
        value += nextValue()
    }
}
