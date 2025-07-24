import SwiftUI

struct FoodItem: View {
  var data: FoodData
  
  func OpenLink() {
    print("Opening: " + data.link)
  }
  
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 16)
        .fill(.white)
        .stroke(.gray, lineWidth: 2)
        .frame(width: 250, height: 70)
        .shadow(radius: 1, y: 2)
        .opacity(0.8)
      
      HStack {
        Text(data.emoji)
          .font(.largeTitle)
          .padding()
        Spacer()
        Text(data.name)
          .bold()
        Spacer()
        Button(action: OpenLink) {
          ZStack {
            Circle()
              .fill(
                LinearGradient(
                  gradient: Gradient(colors: [.teal, .purple]),
                  startPoint: .topLeading,
                  endPoint: .bottomTrailing
                )
              )
              .opacity(0.2)
              .frame(width: 50, height: 50)
            Image(systemName: "link")
          }
        } .padding()
      }
    }.frame(width: 250, height: 70)
  }
  
}

struct FoodData {
  var emoji: String = ""
  var name: String = ""
  var link: String = ""
  
  init(emoji: String, name: String, link: String) {
    self.emoji = emoji
    self.name = name
    self.link = link
  }
  
  static func RandomData() -> FoodData {
    guard let (name, details) = foodDict.randomElement(), details.count == 2 else {
      return FoodData(emoji: "❓", name: "Unknown", link: "#")
    }
    
    return FoodData(emoji: details[0], name: name, link: details[1])
  }
}
