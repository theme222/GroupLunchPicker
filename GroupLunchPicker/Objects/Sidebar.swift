import SwiftUI

struct Sidebar: View {
  @State var isOpen: Bool = false
  var body: some View {
    ZStack (alignment: .leading){
      SidebarMenu(isOpen: $isOpen)
      VStack {
        HStack {
          SidebarButton(isOpen: $isOpen)
          Spacer()
        }
        Spacer()
      }
    }
  }
}

struct SidebarMenu: View {
  @Binding var isOpen: Bool
  @State var currentOffset: CGFloat = 0
  
  
  var body: some View {
    ZStack {
      Rectangle()
        .frame(width: 300)
        .foregroundColor(.gray)
    }
    .offset(x: isOpen ? 0: -400)
    .animation(.easeOut(duration: 0.5), value: isOpen)
  }
}

struct SidebarButton: View {
  @Binding var isOpen: Bool
  
  func ToggleIsOpen() {
    isOpen.toggle()
    print("The sidebar is now \(isOpen)")
  }
  
  var body: some View {
    Button(action: ToggleIsOpen) {
      ZStack {
        Circle()
          .frame(width: 30, height: 30)
          .foregroundStyle(.white)
        Image(systemName: "line.3.horizontal")
      }
    }
    .frame(width: 30, height: 30)
    .padding()
  }
}


