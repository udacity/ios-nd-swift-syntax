//: ## Downcasting with as? and as!

import UIKit

//: ### Downcasting
class Beverage {
    var category:String
    init (category: String) {
        self.category = category
    }
}

class HotDrink: Beverage {
    var pairing:String
    
    init (category: String, pairing: String) {
        self.pairing = pairing
        super.init(category: category)
    }
}

class ColdDrink: Beverage {
    var vessel:String
    
    init (category: String, vessel: String) {
        self.vessel = vessel
        super.init(category: category)
    }
}

var drinkChoices = [
    HotDrink(category: "coffee", pairing: "biscotti"),
    HotDrink(category: "tea", pairing: "crumpets"),
    ColdDrink(category: "lemonade", vessel: "glass"),
    ColdDrink(category: "beer", vessel: "frosty mug")
]

// Generic drink offer
for beverage in drinkChoices {
    print ("Can I get you a \(beverage.category)")
}
//: Type cast operators: __as?__ and __as!__
// Specific drink offer
for beverage in drinkChoices {
    if let coldDrink = beverage as? ColdDrink {
        print ("Can I offer you a \(coldDrink.vessel) of \(coldDrink.category)?")
    } else if let hotDrink = beverage as? HotDrink {
        print ("Can I get you some \(hotDrink.category) with \(hotDrink.pairing)?")
    }
}
//: ### Downcasting with as!
var coffeeArray: [Beverage] = [
    HotDrink(category: "coffee", pairing: "biscotti"),
    HotDrink(category: "coffee", pairing: "scones"),
    HotDrink(category: "coffee", pairing: "biscotti"),
]

for beverage in coffeeArray {
    let hotDrink = beverage as! HotDrink
        print ("Can I get you some \(hotDrink.category) with \(hotDrink.pairing)?")
}
