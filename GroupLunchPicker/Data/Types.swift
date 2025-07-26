import SwiftUI

struct FoodData: Codable {
  var id: Int
  var emoji: String
  var name: String // must be unique
  var link: String
  
  init(emoji: String = "", name: String = "", link: String = "", id: Int = -1) {
    self.emoji = emoji
    self.name = name
    self.link = link
    self.id = id
  }
  
  mutating func SetUniqueId() {
    id = Int(Date().timeIntervalSince1970 * 1000)
  }
  
  static func RandomData() -> FoodData {
    guard let (name, details) = Misc.foodDict.randomElement(), details.count == 2 else {
      return FoodData(emoji: "❓", name: "Unknown", link: "#")
    }
    
    return FoodData(emoji: details[0], name: name, link: details[1])
  }
}
