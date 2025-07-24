import SwiftUI


struct Wheel: View {
  @State var currentYOffset: CGFloat = GetYOffsetAtIndex(98)
  @State var currentlyRolling: Bool = false
  
  func SpinWheel() {
    if currentlyRolling { return }
    
    currentlyRolling = true
    currentYOffset = Wheel.GetYOffsetAtIndex(98)
    withAnimation(Animation.timingCurve(0.3, 0.03, 0.4, 1.0, duration: 8.0)) {
      currentYOffset = Wheel.GetYOffsetAtIndex(2)
      DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
        currentlyRolling = false
      }
    }
  }
  
  static func GetYOffsetAtIndex(_ index: Int) -> CGFloat {
    return -CGFloat(70 * (index-2) + 35)
  }
  
  var body: some View {
    GeometryReader { scrollViewInfo in
      VStack {
        ScrollView {
          ScrollView {
            VStack (spacing: 0) {
              ForEach(0..<100) { index in
                DynamicFoodItem(data: FoodData.RandomData(), scrollYCenter: scrollViewInfo.frame(in: .global).midY)
                  .id(index)
              }
            }
          }.offset(x: 0, y: currentYOffset)
            .scrollDisabled(true)
        }.frame(width: 300, height: 280)
          .scrollDisabled(true)
        SpinButton(CallbackFunction: SpinWheel)
          .offset(x: 0, y: 40)
      }
    }.frame(width: 300, height: 280)
  }
}

struct SpinButton: View {
  
  var CallbackFunction: () -> Void
  
  var body: some View {
    Button(action: CallbackFunction) {
      ZStack {
        Circle()
          .fill(.yellow.opacity(0.2))
        Circle()
          .fill(
            LinearGradient(
              gradient: Gradient(colors: [.gray.opacity(0.1), .white]),
              startPoint: .bottom,
              endPoint: .topTrailing
            )
          ).stroke(.gray.opacity(0.2), lineWidth: 4)
        Image(systemName: "arrow.trianglehead.2.counterclockwise")
          .scaleEffect(2.5)
          .foregroundStyle(.black)
        
      }
    }
    .frame(width: 100, height: 100)
  }
  
}

struct DynamicFoodItem: View { // Contains food item but will dynamically size it based on y pos
  let data: FoodData
  @State var scrollYCenter: CGFloat
  
  func GetAlpha(_ yOffset: CGFloat) -> CGFloat {
    return yOffset.MapRangeClamp(inMin: 0.0, inMax: 150.0, outMin: 1.0, outMax: 0.0)
  }
  
  var body: some View {
    GeometryReader { info in
      let alpha = GetAlpha(abs(info.frame(in: .global).midY - scrollYCenter))
      FoodItem(data: data)
        .scaleEffect(alpha)
        .opacity(alpha)
    }.frame(width: 250, height: 70)
  }
  
}

