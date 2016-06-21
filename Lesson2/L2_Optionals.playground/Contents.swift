//: # All about Optionals!
import UIKit
//: ### Example 1: Nil is disallowed in most Swift types

// Ints can't store nil values
var x: Int
//x = nil

// Object references can't store nil values either
var c: AnyObject
c = UIColor.redColor()
//c = nil

//: ### Cool! Except, sometimes we need nil values.
//: 1. A method that cannot return a value
var y: Int?
var s1: String
var s2: String

s1 = "123"
s2 = "ABC"

y = Int(s1)
y = Int(s2)

//: 2. Properties that cannot be initialized when an object is constructed
class ViewController: UIViewController {
    var button: UIButton!
}

















//: ### Declaring optionals with Question Marks
// Example 1
var z: Int?
var string: String
string = "123"
z = Int(string)
//z * 2

// Example 2
class AnotherViewController: UIViewController {
    //var anotherButton: UIButton
}




































//: ### Unwrapping Optionals with if let
// Example 1: A scenario that could return an optional with a nil value
var zee: Int?

let strings = ["ABC","123"]
let randomIndex = Int(arc4random() % 2)
let anotherString = strings[randomIndex]

zee = Int(anotherString)

if let intValue = zee {
    intValue * 2
} else {
    "No value"
}

//Example 2: Another example with UIImageView

var imageView = UIImageView()

imageView.image = UIImage(named:"puppy_in_box")
if let image = imageView.image {
    let size = image.size
} else {
    print("This image hasn't been set.")
}
imageView.image

//: ### Optional Chaining
// Example 1
var anotherImageView = UIImageView()
anotherImageView.image = UIImage(named:"puppy_in_box")

var size = anotherImageView.image?.size
size.dynamicType

if let imageSize = anotherImageView.image?.size {
    print("Here's the image size: \(imageSize)")
} else {
    print("This image hasn't been set.")
}

imageView.image


// Example 2

var animal = Animal(name: "Lenny", species: "lemur", tailLength: 12)

animal = Animal(name: "Gilbert", species: "Gorilla", tailLength: nil )

if let tailLength = animal.tail?.length {
    print("\(animal.name)'s tail is \(tailLength) long")
} else {
    print("\(animal.name) doesn't have a tail.")
}

//: ### Implicitly Unwrapped Optionals
// Example 1
let w =  Int("123")!
w * 2

// Example 2
class BetterViewController: UIViewController {
    var myButton: UIButton!
}

//: ### Optionals can be passed as parameters to functions

// Example: Picking up groceries in an optional car
func pickUpGroceries(car:Car?) {
    if let car = car {
        print("We'll pick up the groceries in the \(car.model)")
    } else {
        print("Let's walk to the store")
    }
}

var someCar = Car(make: "Toyota", model: "Corolla")
pickUpGroceries(someCar)

pickUpGroceries(nil)

// Example: Hosting a guest in an optional extra room
func host(guest: String, extraRoom: Room?) {
    if let extraRoom = extraRoom {
        print("Come stay with us, \(guest), you can sleep in the \(extraRoom.name).")
    } else {
        print("Come stay with us, \(guest), you can sleep on the couch.")
    }
}

var someRoom = Room(name: "guest room", occupied: false)
host("Grandma", extraRoom: someRoom)
host("Ryan", extraRoom: nil)







