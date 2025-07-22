import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Background()
            VStack {
                FoodItem(foodEmoji: "🍎", foodName: "Apple", foodLink: "https://www.youtube.com")
                FoodItem(foodEmoji: "🍎", foodName: "Apple", foodLink: "https://www.youtube.com")
                FoodItem(foodEmoji: "🍎", foodName: "Apple", foodLink: "https://www.youtube.com")
                FoodItem(foodEmoji: "🍎", foodName: "Apple", foodLink: "https://www.youtube.com")
            }
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
