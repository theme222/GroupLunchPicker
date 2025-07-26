import SwiftUI
import MCEmojiPicker

struct Sidebar: View {
  @State var isOpen: Bool = false
  var body: some View {
    ZStack {
      Sidebar_Menu(isOpen: $isOpen)
      Sidebar_Menu_Button(isOpen: $isOpen).offset(x: 150, y: -360)
    }
  }
}

fileprivate struct Sidebar_Menu: View {
  @Binding var isOpen: Bool
  @State var currentOffset: CGFloat = 0
  @EnvironmentObject var foodListData: FoodListData
  
  var body: some View {
    ZStack {
      Rectangle()
        .frame(width: 500)
        .foregroundStyle(.background)
        .opacity(0.89)
        .border(.gray, width: 2)
      
      VStack(spacing: 0) {
        Sidebar_Menu_Add()
          .padding()
        Rectangle()
          .frame(width: 500, height: 2)
          .foregroundStyle(.gray)
        Text("Food List")
          .font(.title)
          .bold()
          .padding()
        ScrollView {
          VStack (spacing: 20) {
            ForEach(foodListData.userProvidedFoodDict.keys.sorted(), id: \.self) { id in
              Sidebar_Menu_Delete(data: foodListData.userProvidedFoodDict[id] ?? FoodData.RandomData())
            }
          }
        }.frame(width: 400, height: 570)
        Spacer()
      }
    }
    .offset(x: 0, y: isOpen ? 180: 1000)
    .animation(.easeInOut(duration: 0.3), value: isOpen)
  }
}

fileprivate struct Sidebar_Menu_Add: View {
  @State var currentFoodData: FoodData = FoodData.RandomData()
  @EnvironmentObject var foodListData: FoodListData

  var body: some View {
    HStack (spacing: 20){
      FoodItem(data: $currentFoodData, inputFieldDisabled: false)
      Button(action: {foodListData.AddToUserProvidedFoodDict(currentFoodData)}) {
        ZStack {
          Circle()
            .frame(width: 60, height: 60)
            .foregroundStyle(.background)
            .shadow(radius: 2, x: 0, y: 2)
          Circle()
            .foregroundStyle(
              LinearGradient(
                gradient: Gradient(colors: [.green.opacity(0.3), .green.opacity(0.8)]),
                startPoint: .topTrailing,
                endPoint: .bottomLeading)
            )
            .frame(width: 60, height: 60)
          Image(systemName: "plus")
            .scaleEffect(1.9)
            .foregroundStyle(.foreground)
          
        }
      }
    }
  }
}

fileprivate struct Sidebar_Menu_Delete: View {
  @State var data: FoodData
  @EnvironmentObject var foodListData: FoodListData

  var body: some View {
    HStack (spacing: 20) {
      FoodItem(data: $data)

      Button(action: {foodListData.RemoveFromUserProvidedFoodDict(data.id)}) {
        ZStack {
          Circle()
            .frame(width: 60, height: 60)
            .foregroundStyle(.background)
            .shadow(radius: 2, x: 0, y: 2)
          Circle()
            .foregroundStyle(
              LinearGradient(
                gradient: Gradient(colors: [.red.opacity(0.3), .red.opacity(0.8)]),
                startPoint: .topTrailing,
                endPoint: .bottomLeading)
            )
            .frame(width: 60, height: 60)
          Image(systemName: "trash")
            .scaleEffect(1.9)
            .foregroundStyle(.foreground)
        }
      }
    }
  }
}

fileprivate struct Sidebar_Menu_Button: View {
  @Binding var isOpen: Bool
  
  func ToggleIsOpen() {
    isOpen.toggle()
  }
  
  var body: some View {
    Button(action: ToggleIsOpen) {
      ZStack {
        Circle()
          .frame(width: 40, height: 40)
          .foregroundStyle(.foreground)
        Image(systemName: "line.3.horizontal")
          .foregroundStyle(.background)
          .scaleEffect(1.2)
      }
    }
    .frame(width: 40, height: 40)
  }
}


