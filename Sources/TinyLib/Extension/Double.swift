import Foundation

public extension Double {
    var percentageString: String {
        (isNaN || isInfinite) ? "N/A" : String(format: "%.0f%%", self * 100)
    }

    var memoryString: String {
        if isNaN || isInfinite {
            return "N/A"
        }
        return self < 1.0 ? String(Int(self * 1000.0)) + " MB" : String(format: "%.2f", self) + " GB"
    }
}
