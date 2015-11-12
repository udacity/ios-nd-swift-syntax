//: # Collections

import UIKit
import Foundation

// Array - ordered list of items

// Dictionary - collection of key-value pairs

// Set - unordered list of distinct values

//: ### Initializing Arrays
// The verbose way
var numbers = Array<Double>()

// More often you will see ...
var moreNumbers = [Double]()
moreNumbers = [85.0, 90.0, 95.0]

// Array literal syntax
let differentNumbers = [97.5, 98.5, 99.0]

// Array concatenation is super convenient in Swift.
moreNumbers = moreNumbers + differentNumbers

// An array can hold any type of object.
var circuit = [livingRoomSwitch, kitchenSwitch, bathroomSwitch]
//: ### Array operations: append, insert, remove, count, retrieve
var roadTripMusic = ["Neil Young","Kendrick Lamar","Flo Rida", "Nirvana"]
roadTripMusic.append("Rae Sremmurd")
roadTripMusic.insert("Dej Loaf", atIndex: 2)
roadTripMusic.removeAtIndex(3)
roadTripMusic.insert("Keith Urban", atIndex: 3)
roadTripMusic.count

let musician = roadTripMusic[2]

//: ### Dictionary initialization
// Initializer syntax
var groupsDict = [String:String]()

// Dictionary literal
var animalGroupsDict = ["whales":"pod", "geese":"flock", "lions": "pride"]

// Another example
var averageLifeSpanDict = [String:Range<Int>]()
var lifeSpanDict = ["African Grey Parrot": 50...70, "Tiger Salamander": 12...15, "Bottlenose Dolphin": 20...30]

//: ### Dictionary operations: insert, remove, count, update, retrieve
// Adding items to a dictionary
animalGroupsDict["crows"] = "murder"
animalGroupsDict["monkeys"] = "troop"

// The count method is available to all collections.
animalGroupsDict.count
print(animalGroupsDict)

// Removing items from a dictionary
animalGroupsDict["crows"] = nil
animalGroupsDict

// Updating a value
animalGroupsDict["monkeys"] = "barrel"
var group = animalGroupsDict.updateValue("gaggle", forKey: "geese")
group.dynamicType

animalGroupsDict.updateValue("crash", forKey:"rhinoceroses")
print(animalGroupsDict)

//Retrieving the value for a particular key
let groupOfWhales = animalGroupsDict["whales"]
//: Why would the code below return an optional?
//:
//:     animalGroupsDict["whales"]
// We unwrap a value returned from a dictionary just like we would unwrap any other optional.
if let groupOfWhales = animalGroupsDict["whales"] {
    print("We saw a \(groupOfWhales) of whales from the boat.")
} else {
    print("No value found for that key.")
}

// What happens if the key isn't found?
if let groupOfSasquatches = animalGroupsDict["Sasquatches"] {
    print("We saw a \(groupOfSasquatches) of Sasquatches on our hike.")
} else {
    print("No value found for that key.")
}

//: ## Sets
//: Literal syntax
var cutlery: Set = ["fork", "knife", "spoon"]
var flowers:Set<Character> = ["🌷","🌹","🌸"]
//: Initializer syntax
var utensils = Set<String>()
var trees = Set<Character>()
//: Set operations: Insert, Remove, Count
trees.insert("🌲")
trees.insert("🌳")
trees.insert("🌵")

trees.remove("🌵")
trees.count

