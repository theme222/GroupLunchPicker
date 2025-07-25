import SwiftUI
import MCEmojiPicker
import Foundation

struct FoodItem: View {
  @Environment(\.colorScheme) var colorScheme
  @Binding var data: FoodData
  @State var inputFieldDisabled: Bool = true
  @State var emojiPickerOn: Bool = false
  
  func OpenLink() {
    print("Opening: " + data.link)
  }
  
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 16)
        .fill(.white.opacity(colorScheme == .light ? 0: 0.4))
        .stroke(.gray, lineWidth: 2)
        .frame(width: 250, height: 70)
        .shadow(color: .primary,radius: 1, y: 2)
        .opacity(0.8)
      
      HStack {
        Button(data.emoji, action: {emojiPickerOn.toggle()})
          .font(.title)
          .padding()
          .disabled(inputFieldDisabled)
          .emojiPicker(isPresented: $emojiPickerOn, selectedEmoji: $data.emoji)
        Spacer()
        TextField("", text: $data.name)
          .font(.footnote)
          .bold()
          .disabled(inputFieldDisabled)
        Spacer()
        Button(action: OpenLink) {
          ZStack {
            Circle()
              .fill(.white.opacity(0.6))
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
