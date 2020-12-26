import Foundation

public extension Array {
    func appending(_ newElement: Element, condition: Bool = true) -> [Element] {
        condition ? self + [newElement] : self
    }
}
