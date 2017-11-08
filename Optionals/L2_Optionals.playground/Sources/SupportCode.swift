//
// This file (and all other Swift source files in the Sources directory of this playground) will be precompiled into a framework which is automatically made available to Optionals.playground.
//


public struct Tail {
    public var length: String
    
    public init(length:Int) {
        self.length = "\(length) cm"
    }
}

public class Animal {
    public var name:String
    public var species: String = "homo sapiens"
    public var tail: Tail?
    
    public init(name: String, species: String, tailLength:Int?) {
        self.name = name
        self.species = species
        if let tailLength = tailLength {
             self.tail = Tail(length: tailLength)
        } else {
            self.tail =   nil
        }
       
    }
}

public class Car {
    public var make:String
    public var model: String
    
    public init(make: String, model: String) {
        self.make = make
        self.model = model
    }
}

public class Room {
    public var name:String
    public var occupied: Bool
    
    public init(name: String, occupied: Bool) {
        self.name = name
        self.occupied = occupied
    }
}


