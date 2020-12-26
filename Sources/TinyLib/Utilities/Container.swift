import Foundation

public enum Container {
    public static let defaults = UserDefaults(suiteName: "io.github.jaksatomovic.shared")
    static let pListEncoder = PropertyListEncoder()
    static let pListDecoder = PropertyListDecoder()

    public static func get<T: SharedEntry>(_ type: T.Type) -> T? {
        if let data = defaults?.data(forKey: T.containerKey), let decoded = try? pListDecoder.decode(type, from: data) {
            return decoded
        }
        return nil
    }

    public static func set<T: SharedEntry>(_ value: T?) {
        if let value = value, let encoded = try? pListEncoder.encode(value) {
            defaults?.setValue(encoded, forKey: T.containerKey)
        }
    }
}
