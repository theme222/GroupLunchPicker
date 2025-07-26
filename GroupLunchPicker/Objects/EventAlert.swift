import SwiftUI


struct EventAlert: View {
  @State var text: String = "Default Text"
  @State var color: Color = .green
  @State var currentAlpha: CGFloat = 0
  
  
  var currentYOffset: CGFloat {
    currentAlpha.MapRangeClamp(inMin: 0, inMax: 1, outMin: 0, outMax: -150)
  }
  
  func FadeOut() {
    withAnimation(.easeOut(duration: 0.2)) {
      currentAlpha = 0
    }
  }
  
  func FadeIn() {
    withAnimation(.easeOut(duration: 0.2)) {
      DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: FadeOut)
      currentAlpha = 1
    }
  }
  
  var body: some View {
    VStack {
      Spacer()
      ZStack {
        RoundedRectangle(cornerRadius: 16)
          .foregroundStyle(color)
          .frame(width: 250, height: 35)
        Text(text)
          .foregroundStyle(.background)
          .bold()
          .font(.headline)
      }
      .offset(x: 0, y: currentYOffset)
      .opacity(currentAlpha)
    }
    .onAppear {
      NotificationCenter.default.addObserver( forName: .alertEvent, object: nil, queue: .main ) { notification in
        if let text_notification = notification.userInfo?["text"] as? String {
          text = text_notification
        }
        if let color_notification = notification.userInfo?["color"] as? Color {
          color = color_notification
        }
        
        FadeIn()
      }
    }
  }
}
