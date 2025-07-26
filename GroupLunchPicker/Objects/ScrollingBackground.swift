import SwiftUI


struct Background: View {
  static var foodEmojis = Misc.foodEmojis
  
  init(){
    Background.foodEmojis.shuffle()
  }
  
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      ZStack {
        ForEach(0..<6) { index in
          Background_Column(index: index)
        }
      }
    }
    .ignoresSafeArea()
    .allowsHitTesting(false)
  }
}

fileprivate struct Background_Column: View {
  @Environment(\.colorScheme) var colorScheme
  @State var index: Int
  @State var currentXOffset: CGFloat
  @State var isInit: Bool = true
  
  var foodIndexStart: Int {
    return index * 10
  }
  
  var travelTime: Double {
    if isInit {
      return Double(6 + index)
    }
    else {
      return 6.0
    }
  }
  
  init(index i: Int) {
    index = i
    currentXOffset = CGFloat(-100 - (i * 100))
  }
  
  func AnimateX() {
    withAnimation(.linear(duration: travelTime)) {
      currentXOffset = 500
    }
    DispatchQueue.main.asyncAfter(deadline: .now() + travelTime) {
      if index == 0 {
        Background.foodEmojis.shuffle()
      }
      isInit = false
      currentXOffset = -100
      AnimateX()
    }
  }
  
  var body: some View {
    VStack (spacing: 90) {
      ForEach(1..<10) { i in
        Text(Background.foodEmojis[foodIndexStart + i])
          .font(.title2)
          .opacity(colorScheme == .light ? 0.4: 0.8)
      }
    }
    .offset(x: currentXOffset, y: index % 2 == 0 ? 50: 0)
    .onAppear(perform: AnimateX)
  }
  
}
