import SwiftUI

struct Wheel: View {
  @EnvironmentObject var foodListData: FoodListData
  
  func GenResultAndNeighbors() -> [FoodData] {
    // Trust me bro
    var list: [FoodData] = []
    let one = foodListData.GetRandomItemFromUserProvidedFoodDict()
    let two = foodListData.GetRandomItemFromUserProvidedFoodDict()
    let three = foodListData.GetRandomItemFromUserProvidedFoodDict()
    list.append(one)
    list.append(two)
    list.append(three)
    list.append(one)
    list.append(two)
    list.append(three)
    return list
  }
  
  var body: some View {
    WheelIntermediate(resultAndNeighbors: GenResultAndNeighbors())
  }
}

struct WheelIntermediate: View {
  @EnvironmentObject var foodListData: FoodListData
  @State var currentYOffset: CGFloat = GetYOffsetAtIndex(99)
  @State var currentlyRolling: Bool = false
  @State var resultAndNeighbors: [FoodData]
  @State var theRestOfTheShit: [FoodData] = Array<FoodData>()
  
  func SpinWheel() {
    if currentlyRolling { return }
    
    // So it's not obvious that the whole thing doesn't regenerate every time cause it's too laggy
    resultAndNeighbors[3] = resultAndNeighbors[0]
    resultAndNeighbors[4] = resultAndNeighbors[1]
    resultAndNeighbors[5] = resultAndNeighbors[2]
    resultAndNeighbors[0] = foodListData.GetRandomItemFromUserProvidedFoodDict()
    resultAndNeighbors[1] = foodListData.GetNextItem()
    resultAndNeighbors[2] = foodListData.GetRandomItemFromUserProvidedFoodDict()

    
    currentlyRolling = true
    currentYOffset = WheelIntermediate.GetYOffsetAtIndex(99)
    withAnimation(Animation.timingCurve(0.3, 0.03, 0.4, 1.0, duration: 8.0)) {
      currentYOffset = WheelIntermediate.GetYOffsetAtIndex(2)
      DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
        currentlyRolling = false
      }
    }
  }
  
  static func GetYOffsetAtIndex(_ index: Int) -> CGFloat {
    return CGFloat(-70 * (index-2) + 35)
  }
  
  var body: some View {
    GeometryReader { scrollViewInfo in
      VStack {
        ScrollView {
          ScrollView {
            VStack (spacing: 0) {
              ForEach(0..<3) { index in
                ResultFoodItem(data: $resultAndNeighbors[index], scrollYCenter: scrollViewInfo.frame(in: .global).midY)
              }
              ForEach(3..<97) { index in
                DynamicFoodItem(data: foodListData.GetRandomItemFromUserProvidedFoodDict(), scrollYCenter: scrollViewInfo.frame(in: .global).midY)
                  .id(index)
              }
              ForEach(3..<6) { index in
                ResultFoodItem(data: $resultAndNeighbors[index], scrollYCenter: scrollViewInfo.frame(in: .global).midY)
              }
            }.frame(width: 300)
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
          .fill(.background)
          .shadow(radius: 2, x: 0,y: 2)
        Circle()
          .fill(
            LinearGradient(
              gradient: Gradient(colors: [.yellow.opacity(0.2), .yellow.opacity(0.9)]),
              startPoint: .topTrailing,
              endPoint: .bottomLeading
            )
          )
        Image(systemName: "arrow.trianglehead.2.counterclockwise")
          .scaleEffect(2.5)
          .foregroundStyle(.foreground)
        
      }
    }
    .frame(width: 100, height: 100)
  }
  
}

struct DynamicFoodItem: View { // Contains food item but will dynamically size it based on y pos
  @State var data: FoodData
  @State var scrollYCenter: CGFloat
  
  func GetAlpha(_ yOffset: CGFloat) -> CGFloat {
    return yOffset.MapRangeClamp(inMin: 0.0, inMax: 150.0, outMin: 1.0, outMax: 0.0)
  }
  
  var body: some View {
    GeometryReader { info in
      let alpha = GetAlpha(abs(info.frame(in: .global).midY - scrollYCenter))
      FoodItem(data: $data)
        .scaleEffect(alpha)
        .opacity(alpha)
    }.frame(width: 250, height: 70)
  }
}

struct ResultFoodItem: View { // Contains food item but will dynamically size it based on y pos
  @Binding var data: FoodData
  @State var scrollYCenter: CGFloat
  
  func GetAlpha(_ yOffset: CGFloat) -> CGFloat {
    return yOffset.MapRangeClamp(inMin: 0.0, inMax: 150.0, outMin: 1.0, outMax: 0.0)
  }
  
  var body: some View {
    GeometryReader { info in
      let alpha = GetAlpha(abs(info.frame(in: .global).midY - scrollYCenter))
      FoodItem(data: $data)
        .scaleEffect(alpha)
        .opacity(alpha)
    }.frame(width: 250, height: 70)
  }
}

