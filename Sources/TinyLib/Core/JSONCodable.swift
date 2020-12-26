public protocol JSONCodabble {
    init?(json: JSON)

    var json: JSON { get }
}

public extension JSONCodabble where Self: RawRepresentable, Self.RawValue == String {
    var json: JSON {
        JSON(rawValue)
    }

    init?(json: JSON) {
        guard let string = json.string else {
            return nil
        }
        self.init(rawValue: string)
    }
}
