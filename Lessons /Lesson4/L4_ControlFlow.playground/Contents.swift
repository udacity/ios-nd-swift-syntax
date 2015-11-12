//: # Control Flow

import UIKit
import Foundation
//: ## I. Traditional C-style for loop
for var index = 99; index > 0; --index {
    print("\(index) bottles of beer on the wall. \(index) bottles of beer. Take one down, pass it around ...")
}

//: ## II. Fast enumeration with for-in

//: For-in loops take the form:
//:
//:     for item in Collection {
//:         statements to execute on each item
//:     }

//: ### Example 1
//var demoString = "Swift enumeration is so fast!"
//for character in demoString.characters {
//    print(character)
//}

//: ### Example 2
let intArray = [7, 21, 25, 13, 1]
var sum = 0
for value in intArray {
    sum += value
}
sum
//: ### Example 3: Fast enumeration with Dictionaries!
var movieDict = ["Star Wars": "George Lucas", "Point Break": "Kathryn Bigelow", "When Harry Met Sally": "Rob Reiner", "The Dark Knight": "Christopher Nolan"]

//: Here's a for-in loop that prints out the directors of each movie in movieDict.
for (movie, director) in movieDict {
    print("\(director) directed \(movie)")
}
//:     for item in Collection {
//:         statements to execute on each item
//:     }
//:
//:     for (key, value) in Dictionary {
//:         statement to execute on each key or value
//:     }

//: ### Example 4: More fast enumeration with Dictionaries!
var animalGroupsDict = ["whales":"pod", "geese":"flock", "lions": "pride"]
for (animals, animalGroup) in animalGroupsDict {
    print("Many \(animals) form a \(animalGroup).")
}
//: ## III. While loops

//: While loops take the form:
//:
//:    while condition {
//:        statement
//:    }

//: ### Example 1
var timer = 10

while timer > 0 {
    --timer
}

//: ### Example 2
var beerVolume = 12.0
var sip = 0.3

while beerVolume > 0 {
    print ("Cheers!")
    beerVolume -= sip
}

//: ### Repeat-While loops
//:    repeat {
//:        statement
//:    } while condition

//repeat {
// --timer
//} while timer > 0
//
//repeat {
//    print("Cheers")
//    beerVolume -= sip
//} while beerVolume > 0

//: ## IV. If-else statements

//: If-else statements take the form:
//:
//:    if condition {
//:        statement
//:    } else {
//:        statement
//:    }

//: ### Example 1
var hungry = true
if hungry {
    print("Let's eat!")
} else {
    print("Let's wait.")
}

//: ### Example 2
var vegetarian = false

if hungry && !vegetarian {
    print("Let's eat steak!")
} else if hungry && vegetarian {
    print("How about pumpkin curry?")
} else {
    print("nevermind")
}

//: ### Example 3
var thereIsPie = false
if hungry || thereIsPie {
    print("Let's eat.")
} else {
    print("Nevermind")
}
//: ## V. Switch statements

//: ### Example 1 - Here's an if-else statement that right now is a bit cumbersome.
var birthYear = 1992

if birthYear == 1992 || birthYear == 1980 || birthYear == 1968 {
    print("You were born in the year of the monkey.")
} else if birthYear == 1991 || birthYear == 1979 || birthYear == 1967 {
    print("You were born in the year of the goat")
} else {
    print("You were born in the year of some other animal.")
}

//: Let's translate it into a switch statement.

switch birthYear {
case 1992, 1980, 1968:
    print("You were born in the year of the monkey.")
case 1991,1979,1967:
    print("You were born in the year of the goat.")
default:
    print("You were born in the year of some other animal.")
}

//: Switch statements take the form:
//:
//:    switch variable {
//:    case firstValue:
//:        statement
//:    case secondValue:
//:        statement
//:    case thirdValue, fourthValue:
//:        statement
//:    default:
//:        statement 
//:    }

//: ### Example 2: Switches and Rainbows
var color = ""
var wavelength = 568

switch wavelength {
case 380...450:
    color = "violet"
case 451...495:
    color = "blue"
case 496...570:
    color = "green"
case 571...590:
    color = "yellow"
case 591...620:
    color = "orange"
case 621...750:
    color = "red"
default:
    color = "not visible"
}
//: ### Example 3: No fallthrough in Swift
let temperature = 55
switch temperature {
case 10...55:
    print("Brrr")
case 55...78:
    print("Comfortable")
case 78...95:
    print("Sweaty")
default:
    print("Very uncomfortable")
}
