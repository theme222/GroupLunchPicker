import SwiftUI

struct FoodItem: View {
    @State var foodEmoji: String = ""
    @State var foodName: String = ""
    @State var foodLink: String = ""
    
    func ModifyEmoji() {
        print("changing")
        foodEmoji = "A"
    }
    
    func OpenLink() {
        
    }
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(.white)
                .stroke(.gray, lineWidth: 2)
                .frame(width: 250, height: 70)
                
            HStack {
                Text(foodEmoji)
                    .font(.largeTitle)
                    .padding()
                Spacer()
                Text(foodName)
                    .bold()
                Spacer()
                Button(action: OpenLink) {
                    ZStack {
                        Circle()
                            .fill(
                                LinearGradient(
                                gradient: Gradient(colors: [.teal, .purple]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                                )
                            )
                            .opacity(0.2)
                            .frame(width: 50, height: 50)
                        Image(systemName: "link")
                    }
                } .padding()
            }
        }.frame(width: 250, height: 70)
    }

}
