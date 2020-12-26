import Foundation

public struct Dict<Key, Value> where Key: Hashable {
    public let buildDefault: (Key) -> Value
    public var dict = [Key: Value]()

    public init(buildDefault build: @escaping (Key) -> Value) {
        buildDefault = build
    }

    public subscript(_ key: Key) -> Value {
        get {
            if let value = dict[key] {
                return value
            }
            return buildDefault(key)
        }

        set {
            dict[key] = newValue
        }
    }
}
