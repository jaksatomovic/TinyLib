import Foundation
import WidgetKit

public protocol SharedEntry: Codable {
    static var containerKey: String { get }
}
