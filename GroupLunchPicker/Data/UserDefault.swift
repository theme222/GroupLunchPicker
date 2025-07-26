import Foundation

fileprivate struct UDKeys {
  static let USERPROVIDEDFOODDICT = "userProvidedFoodDict"
  static let CURRENTORDER = "currentOrder"
  static let NOTFIRSTAPPLAUNCH = "notFirstAppLaunch"
}

class FoodListData: ObservableObject {
  @Published var userProvidedFoodDict: [Int: FoodData] = Dictionary<Int, FoodData>()
  @Published var currentOrder: [Int] = Array<Int>()
  @Published var notFirstAppLaunch: Bool = false
  
  func AddToUserProvidedFoodDict(_ data: FoodData) {
    var copy = data
    copy.SetUniqueId()
    userProvidedFoodDict[copy.id] = copy
    currentOrder.append(copy.id)
  }
  
  func RemoveFromUserProvidedFoodDict(_ id: Int) {
    print("Removing \(id) from \(userProvidedFoodDict)")
    userProvidedFoodDict.removeValue(forKey: id)
    for i in 0..<currentOrder.count {
      if currentOrder[i] == id {
        currentOrder.remove(at: i)
        break
      }
    }
  }
  
  func GetNextItem() -> FoodData { // This will allow us to control when it gets restocked and shit
    if (userProvidedFoodDict.isEmpty) { return FoodData(emoji: "😂", name: "Nothing lol") }
    if (currentOrder.isEmpty) { currentOrder = Array(userProvidedFoodDict.keys) }
    currentOrder.shuffle()
    
    guard let output = userProvidedFoodDict[currentOrder.popLast()!] else {
      return GetNextItem() // Unless the user adds so many items then removes them that it goes over the stack overflow limit this won't crash
    }
    return output
  }
  
  
  func GetRandomItemFromUserProvidedFoodDict() -> FoodData {
    return userProvidedFoodDict.randomElement()?.value ?? FoodData.RandomData()
  }

  func LoadFromUserDefault() { // Run on app launch
    print("Loading from user default")
    let decoder = JSONDecoder()
    
    if let currentOrder_data = UserDefaults.standard.array(forKey: UDKeys.CURRENTORDER) as? Array<Int> {
      currentOrder = currentOrder_data
    }
    
    if let userProvidedFoodDict_data = UserDefaults.standard.data(forKey: UDKeys.USERPROVIDEDFOODDICT) {
      if let userProvidedFoodDict_data_decoded = try? decoder.decode([Int: FoodData].self, from: userProvidedFoodDict_data) {
        userProvidedFoodDict = userProvidedFoodDict_data_decoded
      }
    }
    
    notFirstAppLaunch = UserDefaults.standard.bool(forKey: UDKeys.NOTFIRSTAPPLAUNCH)
    
    print(userProvidedFoodDict.isEmpty ? "User provided food dict is empty or couldn't load data.": userProvidedFoodDict)
    
    if (!notFirstAppLaunch) {
      userProvidedFoodDict = Misc.defaultFoodDict
    }
                                        
    print(currentOrder.isEmpty ? "Current order is empty or couldn't load data": currentOrder)
  }
  
  func SaveToUserDefault() {
    print("Saving to user default")
    let encoder = JSONEncoder()
    
    if let encoded = try? encoder.encode(userProvidedFoodDict) {
      UserDefaults.standard.set(encoded, forKey: UDKeys.USERPROVIDEDFOODDICT)
    }
    else {
      print("Couldn't save user provided food dict to user defaults")
    }
    
    UserDefaults.standard.set(currentOrder, forKey: UDKeys.CURRENTORDER)
    UserDefaults.standard.set(true, forKey: UDKeys.NOTFIRSTAPPLAUNCH)
  }
}
