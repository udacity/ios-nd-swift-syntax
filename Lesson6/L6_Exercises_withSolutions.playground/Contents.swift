//: ## Lesson 6 Exercises - Classes, Properties and Methods

import UIKit

//: __Problem 1__
//:
//: __1a.__
//: The compiler is complaining because the class Animal has no initializers. Write an init method for the Animal class and quiet this error. Include a mechanism to initialize the length of the Animal's tail using the Tail struct provided.
struct Tail {
    let lengthInCm: Double
}

class Animal {
    var species: String = ""
    let tail: Tail
    
    // Solution
    init(species: String, tailLength: Double) {
        self.species = species
        self.tail = Tail(lengthInCm: tailLength)
    }
}
//: __1b.__
//: Instantiate and initialize a few different Animals.
// Solution
var kanga = Animal(species: "red kangaroo", tailLength: 100)
var gator = Animal(species: "American alligator", tailLength: 150)
var beaver = Animal(species: "North American beaver", tailLength: 30)

//: __Problem 2__
//:
//: Below are the beginnings of the Peach class.
class Peach {
    let variety: String
    
    // Softness is rated on a scale from 1 to 5, with 5 being the softest
    var softness: Int
    
    //Solution: 2a
    static let varieties = ["donut", "yellow", "white"]
    
    init(variety: String, softness: Int) {
        self.variety = variety
        self.softness = softness
    }

    // Solution: 2b
    func ripen() {
        self.softness += 1
        if self.softness > 4 {
            print("Eat me!")
        } else {
            print( "Give me a little more time.")
        }
    }
}
//: __2a.__
//: Add a type property to the Peach class called "varieties". It should hold an array of different types of peaches. 
//:
//: __2b.__
//: Add an instance method called ripen() that increases the value of the stored property, softness, and returns a string indicating whether the peach is ripe.
//:
//: __2c.__
//: Create an instance of the Peach class and call the method ripen().
// Solution: 2c
let sweetPeach = Peach(variety: "donut", softness: 4)
sweetPeach.ripen()

//: __Problem 3__
//:
//: __3a.__
//:Add the computed property, "cuddlability", to the class, FluffyDog. Cuddlability should be computed based on the values of the stored properties, fluffiness and droolFactor.
var theFluffiestDog = UIImage(named:"fluffyDog")!
class FluffyDog {
    let name: String
    let fluffiness: Int
    let droolFactor: Int
    
    // Solution : 3a
    var cuddlability: Int {
        get {
            return self.fluffiness - self.droolFactor
        }
    }
    
    init(name: String, fluffiness: Int, droolFactor: Int) {
        self.name = name
        self.fluffiness = fluffiness
        self.droolFactor = droolFactor
    }

    func chase(wheeledVehicle: String)-> String {
        return "Where are you going, \(wheeledVehicle)? Wait for me! No, don't go! I will catch you!"
    }
}
//: __3b.__
//: Instantiate and initialize an instance of the class, FluffyDog. Use it to call the method, chase().
// Solution: 3b
var goodDog = FluffyDog(name: "Zebedee", fluffiness: 10, droolFactor: 4)
goodDog.cuddlability
goodDog.chase("skateboarder")

//: __Problem 4__
//:
//: __4a.__
//: Write an instance method, bark(), that returns a different string based on the value of the stored property, size.
enum Size: Int {
    case Small
    case Medium
    case Large
}

class ChattyDog {
    let name: String
    let breed: String
    let size: Size
    
    init(name: String, breed: String, size: Size) {
        self.name = name
        self.breed = breed
        self.size = size
    }
    
    //Solution: 4a
    func bark(size: Size) -> String {
        switch size {
        case .Small:
            return "yip yip"
        case .Medium:
            return "arf arf"
        case .Large:
            return "woof woof"
        }
    }
    
    //Solution: 4c
    static func speak(size: Size) -> String {
        switch size {
        case .Small:
            return "yip yip"
        case .Medium:
            return "arf arf"
        case .Large:
            return "woof woof"
        }
    }
}
//: __4b.__ 
//: Create an instance of ChattyDog and use it to call the method, bark().

//: __4c.__
//: Rewrite the method, bark(), as a type method and rename it speak(). Call your type method to test it out.
//Solution: 4b & 4c
var barkingDog = ChattyDog(name:"Kupar", breed:"Schnauser", size: .Medium)
barkingDog.bark(barkingDog.size)
ChattyDog.speak(.Medium)
//: __Problem 5__
//:
//:__5a.__
//: Write an initialization method for the House class below.
enum Quality {
    case Poor, Fair, Good, Excellent
}

enum NaturalDisaster {
    case Earthquake
    case Wildfire
    case Hurricane
}

class House {
    var numberOfBedrooms: Int = 0
    let location: Quality
   
    // Solution: 5c
    var worthyOfAnOffer: Bool {
        get {
            switch (numberOfBedrooms, location) {
            case (2, .Excellent), (3, .Good), ( 3, .Excellent):
                return true
            default:
                return false
            }
        }
    }
    
    // Solution: 5a
    init (numberOfBedrooms: Int, location: Quality) {
        self.numberOfBedrooms = numberOfBedrooms
        self.location = location
    }
    
    func willStayStanding(naturalDisaster:NaturalDisaster)-> Bool {
        switch naturalDisaster {
        case .Earthquake:
            return true
        case .Wildfire:
            return true
        case .Hurricane:
            return false
        }
    }
}

//: __5b.__
//: Create an instance of the House class and use it to call the method, willStayStanding().  This method takes in a parameter of type NaturalDisaster and return a Bool indicating whether the house will stay standing in a given natural disaster.
// Solution: 5b
let dreamHouse = House(numberOfBedrooms: 3, location: .Excellent)
dreamHouse.willStayStanding(.Earthquake)
dreamHouse.worthyOfAnOffer

//: __5c.__
//: Add a computed property called, "worthyOfAnOffer". This property should be a Bool, whose return value is dependent upon some combination of the stored properties, numberOfBedrooms and location.





