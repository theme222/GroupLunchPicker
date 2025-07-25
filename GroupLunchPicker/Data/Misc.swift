struct Misc {
  
  static let foodDict: [String: [String]] = [
    "Pizza": ["🍕", "https://en.wikipedia.org/wiki/Pizza"],
    "Sushi": ["🍣", "https://en.wikipedia.org/wiki/Sushi"],
    "Burger": ["🍔", "https://en.wikipedia.org/wiki/Hamburger"],
    "Ramen": ["🍜", "https://en.wikipedia.org/wiki/Ramen"],
    "Salad": ["🥗", "https://en.wikipedia.org/wiki/Salad"],
    "Taco": ["🌮", "https://en.wikipedia.org/wiki/Taco"],
    "Dumpling": ["🥟", "https://en.wikipedia.org/wiki/Dumpling"],
    "Steak": ["🥩", "https://en.wikipedia.org/wiki/Steak"],
    "Hot Dog": ["🌭", "https://en.wikipedia.org/wiki/Hot_dog"],
    "Pancakes": ["🥞", "https://en.wikipedia.org/wiki/Pancake"],
    "Spaghetti": ["🍝", "https://en.wikipedia.org/wiki/Spaghetti"],
    "Fried Shrimp": ["🍤", "https://en.wikipedia.org/wiki/Tempura"],
    "Curry": ["🍛", "https://en.wikipedia.org/wiki/Curry"],
    "Rice Ball": ["🍙", "https://en.wikipedia.org/wiki/Onigiri"],
    "Rice": ["🍚", "https://en.wikipedia.org/wiki/Rice"],
    "Bread": ["🍞", "https://en.wikipedia.org/wiki/Bread"],
    "Cheese": ["🧀", "https://en.wikipedia.org/wiki/Cheese"],
    "Cake": ["🍰", "https://en.wikipedia.org/wiki/Cake"],
    "Ice Cream": ["🍨", "https://en.wikipedia.org/wiki/Ice_cream"],
    "Donut": ["🍩", "https://en.wikipedia.org/wiki/Donut"],
    "Chocolate": ["🍫", "https://en.wikipedia.org/wiki/Chocolate"],
    "Croissant": ["🥐", "https://en.wikipedia.org/wiki/Croissant"],
    "Baguette": ["🥖", "https://en.wikipedia.org/wiki/Baguette"],
    "Pretzel": ["🥨", "https://en.wikipedia.org/wiki/Pretzel"],
    "Falafel": ["🧆", "https://en.wikipedia.org/wiki/Falafel"],
    "Shaved Ice": ["🍧", "https://en.wikipedia.org/wiki/Kakigori"],
    "Bento Box": ["🍱", "https://en.wikipedia.org/wiki/Bento"],
    "Soft Drink": ["🥤", "https://en.wikipedia.org/wiki/Soft_drink"],
    "Beer": ["🍺", "https://en.wikipedia.org/wiki/Beer"],
    "Wine": ["🍷", "https://en.wikipedia.org/wiki/Wine"],
    "Milk": ["🥛", "https://en.wikipedia.org/wiki/Milk"],
    "Fries": ["🍟", "https://en.wikipedia.org/wiki/French_fries"],
    "Kebab": ["🥙", "https://en.wikipedia.org/wiki/Kebab"],
    "Lobster": ["🦞", "https://en.wikipedia.org/wiki/Lobster"],
    "Crab": ["🦀", "https://en.wikipedia.org/wiki/Crab"],
    "Octopus": ["🐙", "https://en.wikipedia.org/wiki/Octopus_as_food"],
    "Avocado": ["🥑", "https://en.wikipedia.org/wiki/Avocado"],
    "Corn": ["🌽", "https://en.wikipedia.org/wiki/Maize"],
    "Egg": ["🥚", "https://en.wikipedia.org/wiki/Egg_as_food"],
    "Bacon": ["🥓", "https://en.wikipedia.org/wiki/Bacon"],
    "Meat on Bone": ["🍖", "https://en.wikipedia.org/wiki/Barbecue"],
    "Roasted Sweet Potato": ["🍠", "https://en.wikipedia.org/wiki/Sweet_potato"],
    "Green Apple": ["🍏", "https://en.wikipedia.org/wiki/Apple"],
    "Peach": ["🍑", "https://en.wikipedia.org/wiki/Peach"],
    "Pineapple": ["🍍", "https://en.wikipedia.org/wiki/Pineapple"],
    "Strawberry": ["🍓", "https://en.wikipedia.org/wiki/Strawberry"],
    "Watermelon": ["🍉", "https://en.wikipedia.org/wiki/Watermelon"],
    "Banana": ["🍌", "https://en.wikipedia.org/wiki/Banana"],
    "Cherries": ["🍒", "https://en.wikipedia.org/wiki/Cherry"],
    "Grapes": ["🍇", "https://en.wikipedia.org/wiki/Grape"],
    "Kiwi": ["🥝", "https://en.wikipedia.org/wiki/Kiwifruit"],
    "Coconut": ["🥥", "https://en.wikipedia.org/wiki/Coconut"]
  ]

  static let foodEmojis = [
    "🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🫐", "🍈", "🍒", "🍑", "🥭", "🍍", "🥥",
    "🥝", "🍅", "🍆", "🥑", "🥦", "🥬", "🥒", "🌶️", "🫑", "🌽", "🥕", "🫒", "🧄", "🧅", "🥔", "🍠",
    "🥐", "🥯", "🍞", "🥖", "🫓", "🥞", "🧇", "🧀", "🍖", "🍗", "🥩", "🥓", "🍔", "🍟", "🍕", "🌭",
    "🥪", "🌮", "🌯", "🫔", "🥙", "🧆", "🥚", "🍳", "🥘", "🍲", "🫕", "🥣", "🥗", "🍿", "🧈", "🧂",
    "🥫", "🍱", "🍘", "🍙", "🍚", "🍛", "🍜", "🍝", "🍠", "🍢", "🍣", "🍤", "🍥", "🥮", "🍡", "🥟",
    "🥠", "🥡", "🦀", "🦞", "🦐", "🦑", "🦪", "🍦", "🍧", "🍨", "🍩", "🍪", "🎂", "🍰", "🧁", "🥧",
    "🍫", "🍬", "🍭", "🍮", "🍯", "🍼", "🥛", "☕️", "🫖", "🍵", "🍶", "🍾", "🍷", "🍸", "🍹", "🍺",
    "🍻", "🥂", "🥃", "🫗", "🥤", "🧋", "🧃", "🧉", "🧊"
  ]
  
  static let defaultFoodDict = [1: FoodData(emoji: "🧋", name: "Boba Tea", id: 1), 2: FoodData(emoji: "🍣", name: "Sushi", id: 2), 3: FoodData(emoji: "🍚", name: "Fried Rice", id: 3)]

}


