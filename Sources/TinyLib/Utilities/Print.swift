import Foundation

private let isDebug = CommandLine.arguments.contains(where: { $0 == "--debug" })

public func Print(_ items: Any...) {
    if isDebug {
        for item in items {
            print(item, terminator: "")
            print(" ", terminator: "")
        }
        print("")
    }
}
