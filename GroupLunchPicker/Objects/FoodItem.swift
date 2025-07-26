import SwiftUI
import MCEmojiPicker
import UIKit
import Foundation

struct FoodItem: View {
  @Environment(\.colorScheme) var colorScheme
  @Binding var data: FoodData
  @State var inputFieldDisabled: Bool = true
  @State var emojiPickerOn: Bool = false
  
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
        FoodItem_LinkButton(data: $data, inputFieldDisabled: $inputFieldDisabled)
          .padding()
      }
    }.frame(width: 250, height: 70)
  }
}

fileprivate struct FoodItem_LinkButton: View {
  @Binding var data: FoodData
  @Binding var inputFieldDisabled: Bool
  
  func OpenLink() {
    print(data.link)
    if data.link == "" {
      NotificationCenter.default.post( name: .alertEvent, object: nil, userInfo: ["text": "Link wasn't specified", "color": Color.red] )
    }
    
    guard let url = URL(string: data.link) else {
      NotificationCenter.default.post( name: .alertEvent, object: nil, userInfo: ["text": "URL is invalid", "color": Color.red] )
      return
    }
    
    UIApplication.shared.open(url)
  }
  
  func PasteLink() {
    print(UIPasteboard.general.string)
    guard let clipboardText = (UIPasteboard.general.string ?? "").ExtractLink() else {
      NotificationCenter.default.post( name: .alertEvent, object: nil, userInfo: ["text": "Couldn't Find Link In Clipboard", "color": Color.red] )
      return
    }
    data.link = clipboardText
    NotificationCenter.default.post( name: .alertEvent, object: nil, userInfo: ["text": "Pasted Link From Clipboard", "color": Color.green] )
    print(clipboardText)
  }
  
  var body: some View {
    ZStack {
      Button (action: OpenLink) {
        ZStack {
          Circle()
            .fill(.white.opacity(0.6))
            .frame(width: 50, height: 50)
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
            .foregroundStyle(.blue)
        }
      } .frame(width: 50, height: 50)
        .disabled(!inputFieldDisabled)
      Menu {
        Button(action: PasteLink) {
            Label("Paste From Clipboard", systemImage: "clipboard")
        }

        Button(action: OpenLink) {
            Label("Open Link", systemImage: "link")
        }
      } label: {
        Circle()
          .fill(.clear)
      }.disabled(inputFieldDisabled)
        .frame(width: 50, height: 50)
    }
    

  }
  
}
