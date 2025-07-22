import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Testing")
                .foregroundColor(.green)
            FoodItem(foodEmoji: "🍎", foodName: "Apple", foodLink: "https://www.youtube.com")
                .padding()
        }
    }
}

#Preview {
    ContentView()
}
