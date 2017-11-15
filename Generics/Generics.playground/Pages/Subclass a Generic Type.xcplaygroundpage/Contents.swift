//: [Previous](@previous)
//: ### Subclass a Generic Type
//: A generic type can be subclassed, assuming it is a class. To setup the following example, the `Animal`, `Zebra`, and `ZooExhibit` types are defined.
//:
protocol Animal {
    var name: String { get }
    static var commonName: String { get }
    static var emoji: String { get }
}

struct Zebra: Animal {
    let name: String
    static let commonName = "Zebra"
    static let emoji = "🦓"
}

class ZooExhibit<AnimalType: Animal> {
    let animals: [AnimalType]
    
    init(animals: [AnimalType]) {
        self.animals = animals
    }
    
    func tourTheExhibit() {
        print("Welcome to the \(AnimalType.commonName) Exhibit \(AnimalType.emoji)!")
        for animal in animals {
            print("Say hello to \(animal.name) \(AnimalType.emoji).")
        }
    }
}
//: To subclass the generic type `ZooExhibit`, define a new class with a generic type that can be substituted for `ZooExhibit`'s generic type (any type that implements the `Animal` protocol). In the example below, the generic type `A` is constrained such that it must implement the `Animal` protocol. Hence, when `ZooExhibit` is specified as the superclass, the type `A` can be used without error.
//:
class TravelingExhibit<A: Animal>: ZooExhibit<A> {
    var location: String
    
    init(location: String, animals: [A]) {
        self.location = location
        super.init(animals: animals)
    }
    
    override func tourTheExhibit() {
        print("Welcome to the \(A.commonName) Exhibit \(A.emoji) at \(location)!")
        for animal in animals {
            print("Say hello to \(animal.name) \(A.emoji).")
        }
    }
}

let exhibit1 = TravelingExhibit(location: "Oakland Zoo", animals: [Zebra(name: "Sheila"), Zebra(name: "Zeek")])
exhibit1.tourTheExhibit()

// change exhibit location
exhibit1.location = "San Francisco Zoo"
exhibit1.tourTheExhibit()
//: - Callout(Watch Out!):
//: If a generic type constraint is not fulfilled when subclassing a generic type, then Xcode will complain.
//:
// uncomment the class definition below to see Xcode complain that `TankExhibit`'s generic type `A` does not confirm to the `Animal` protocol.
/*
class TankExhibit<A>: ZooExhibit<A> {
    let volume: Double
    
    init(volume: Double, animals: [A]) {
        self.volume = volume
        super.init(animals: animals)
    }
}
*/
//: [Next](@next)
