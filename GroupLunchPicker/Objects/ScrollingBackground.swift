import SwiftUI

var foodEmojis = [
    "🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🫐", "🍈", "🍒", "🍑", "🥭", "🍍", "🥥",
    "🥝", "🍅", "🍆", "🥑", "🥦", "🥬", "🥒", "🌶️", "🫑", "🌽", "🥕", "🫒", "🧄", "🧅", "🥔", "🍠",
    "🥐", "🥯", "🍞", "🥖", "🫓", "🥞", "🧇", "🧀", "🍖", "🍗", "🥩", "🥓", "🍔", "🍟", "🍕", "🌭",
    "🥪", "🌮", "🌯", "🫔", "🥙", "🧆", "🥚", "🍳", "🥘", "🍲", "🫕", "🥣", "🥗", "🍿", "🧈", "🧂",
    "🥫", "🍱", "🍘", "🍙", "🍚", "🍛", "🍜", "🍝", "🍠", "🍢", "🍣", "🍤", "🍥", "🥮", "🍡", "🥟",
    "🥠", "🥡", "🦀", "🦞", "🦐", "🦑", "🦪", "🍦", "🍧", "🍨", "🍩", "🍪", "🎂", "🍰", "🧁", "🥧",
    "🍫", "🍬", "🍭", "🍮", "🍯", "🍼", "🥛", "☕️", "🫖", "🍵", "🍶", "🍾", "🍷", "🍸", "🍹", "🍺",
    "🍻", "🥂", "🥃", "🫗", "🥤", "🧋", "🧃", "🧉", "🧊"
]

struct Background: View {
    init() {
        foodEmojis.shuffle()
    }
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ZStack {
                ForEach(0..<6) { index in
                    BackgroundColumn(index: index)
                }
            }
        }
        .ignoresSafeArea()
        .allowsHitTesting(false)
    }
}

struct BackgroundColumn: View {
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
                foodEmojis.shuffle()
            }
            isInit = false
            currentXOffset = -100
            AnimateX()
        }
    }
    
    var body: some View {
        VStack (spacing: 90) {
            ForEach(1..<10) { i in
                Text(foodEmojis[foodIndexStart + i])
                    .font(.title2)
                    .opacity(0.4)
            }
        }
        .offset(x: currentXOffset, y: index % 2 == 0 ? 50: 0)
        .onAppear(perform: AnimateX)
    }
    
}
