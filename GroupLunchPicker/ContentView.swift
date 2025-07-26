import SwiftUI
import Combine

struct ContentView: View {
  @Environment(\.scenePhase) var scenePhase
  @State var reloadUI: UUID = UUID()
  
  // Environment objects
  var foodListData = FoodListData()
  
  init() {
    foodListData.LoadFromUserDefault()
  }
  
  var body: some View {
    RootView(reloadUI: $reloadUI)
      .onChange(of: scenePhase) { newPhase in
        switch (newPhase) {
        case .background: foodListData.SaveToUserDefault()
        case .active: reloadUI = UUID()
        default: break
        }
      } .environmentObject(foodListData)
  }
}

struct RootView: View {
  @Binding var reloadUI: UUID
  
  var body: some View {
    ZStack {
      Background().id(reloadUI)
      Title().offset(x: 0, y: -300)
      Wheel().offset(x: 0, y: -80)
      Sidebar()
      EventAlert()
    }
  }
}

#Preview {
  ContentView()
}
