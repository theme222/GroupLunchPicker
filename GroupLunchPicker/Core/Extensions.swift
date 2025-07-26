import SwiftUI

extension Comparable {
  func clamped(_ min: Self, _ max: Self)  ->  Self {
    let val = self
    if (val > max) { return max }
    if (val < min) { return min }
    return val
  }
}
extension FloatingPoint {
  func MapRangeClamp(inMin: Self, inMax: Self, outMin: Self, outMax: Self) -> Self {
    return outMin + ((self.clamped(inMin, inMax) / inMax) * (outMax - outMin))
  }
}

extension String {
  func ExtractLink() -> String? {
    guard let range = self.range(of: #"https://\S+"#, options: .regularExpression) else {
      return nil
    }
    return String(self[range])
  }
}


