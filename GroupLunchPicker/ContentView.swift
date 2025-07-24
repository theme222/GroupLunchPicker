import SwiftUI

struct ContentView: View {
  var body: some View {
    ZStack {
      Background()
      Title().offset(x: 0, y: -300)
      Wheel().offset(x: 0, y: -80)
      HStack {
        Sidebar()
        Spacer()
      }
    }
  }
}

#Preview {
  ContentView()
}
