//: # Lesson 1 Exercises
//: ## String Manipulation
import UIKit
import Foundation
//: ### Exercise 1
//: Example: Here I've declared one String that forms a sentence that makes sense. I've declared a second String that forms a silly sentence when random words are chosen.
let nounArray = ["puppy", "laptop", "ocean","app", "cow", "skateboard", "developer", "coffee", "moon"]

let index1 = Int(arc4random() % 9)
let index2 = Int(arc4random() % 9)

let sentence = "The \(nounArray[6]) spilled her \(nounArray[7])."
let  sillySentence = "The \(nounArray[index1]) jumped over the \(nounArray[index2])."
//: Now try it yourself! Declare a new string that incorporates objects from the noun array above. Write one sentence that makes sense and one "Madlib" sentence with randomly chosen words. Feel free to add words to the noun array or declare a new array.
let yourSentence = "TODO: Incorporate objects from the noun array here."
let yourSillySentence = "TODO: Incorporate randomly chosen objects from the noun array here."
//: ### Exercise 2
//: Recreate the shoutString by using the didYouKnowString as a stem.

let didYouKnowString = "Did you know that the Swift String class comes with lots of useful methods?"
let whisperString = "psst" + ", " + didYouKnowString.lowercaseString
let shoutString =  "HEY! DID YOU KNOW THAT THE SWIFT STRING CLASS COMES WITH LOTS OF USEFUL METHODS?"

//Solution
//let shoutString = "HEY!" + " " + didYouKnowString.uppercaseString
//: ### Exercise 3
//: How many characters are in this string?
let howManyCharacters = "How much wood could a woodchuck chuck if a woodchuck could chuck wood?"

//Solution
let thisMany = howManyCharacters.characters.count
//: ### Exercise 4
//: How many times does the letter "g" or "G" appear in the following string? Use a for-in loop to find out!
let gString = "Gary's giraffe gobbled gooseberries greedily"
var count = 0

// Solution
for character in gString.characters {
    if character == "g" || character == "G" {
        count += 1
    }
}
//: ### Exercise 5
//: Write a program that tells you whether or not this string contains the substring "tuna".
let word = "fortunate"


// Solution
if word.rangeOfString("tuna") != nil {
    print("yes")
}
//: ### Exercise 6
//: Write a program that deletes all occurrences of the word "like" in the following string.
let lottaLikes = "If like, you wanna learn Swift, like, you should build lots of small apps, cuz it's like, a good way to practice."

// Solution
let noLikes = lottaLikes.stringByReplacingOccurrencesOfString("like, ", withString: "")
//: ### Exercise 7
// Example
let sillyMonkeyString = "A monkey stole my iPhone"
let newString = sillyMonkeyString.stringByReplacingOccurrencesOfString("monkey", withString: "🐒")
let newerString = newString.stringByReplacingOccurrencesOfString("iPhone", withString: "📱")

//: Repeat the above string manipulation, but this time using a for-in loop.
//: You can start off with this dictionary and string.
let dictionary = ["monkey": "🐒", "iPhone":"📱"]
var newestString = sillyMonkeyString

// Solution
for (key, value) in dictionary {
    newestString = newestString.stringByReplacingOccurrencesOfString(key, withString: value)
}

print(newestString)
//: ### Exercise 8
//: Josie has been saving her pennies and has them all counted up. Write a program that, given a number of pennies, prints out how much money Josie has in dollars and cents.

// Example
let numOfPennies = 567
//desired output = "$5.67"

//Solution
let dollarInt = numOfPennies/100
let dollarString: String = "$" + "\(dollarInt)" + "."
let centsString: String =  String(numOfPennies % 100)
let finalString = dollarString + centsString

//: # Let or Var?
import UIKit
import Foundation
//: ### Exercise 9
//: Below is the code to find all the numbers present in an array, convert them to Ints, and calculate their sum. Have a look at the entities declared below: array, sum, and intToAdd. Think about whether each should be a constant or a variable and choose whether to declare them with let or var. When you're finished uncomment the code and see if the compiler agrees with your choices!

// let or var array = ["A", "13", "B","5","87", "t", "41"] // TODO: Choose constant or variable
// let or var sum = 0 // TODO: Choose constant or variable
// for String in array {
//     if String.toInt() != nil {
//         let or var intToAdd = String.toInt()! // TODO: Choose constant or variable
//         sum += intToAdd
//     }
// }
// println(sum)

// Solution
// let array = ["A", "13", "B","5","87", "t", "41"]
// var sum = 0
// for String in array {
//     if String.toInt() != nil {
//         let intToAdd = String.toInt()!
//         sum += intToAdd
//     }
// }
// println(sum)
//: ### Exercise 10
//: For each of the following pairs, choose whether to declare a constant or a variable.
//:
//: Example: Two hikers are climbing up to the summit of a mountain. Along the way, they stop a few times to check their current elevation.
//:
//: Example response:
let summitElevation: Int
var currentElevation: Int
//: 10a) Imagine you are writing a quiz app, and you need to program a timer that will stop a quiz after 20 min. Declare four entities: startTime, currentTime, maximumTimeAllowed, and timeRemaining. Don't worry about encoding their values.

// Solution
let startTime: NSDate
let maximumTimeAllowed: Double
var currentTime: NSDate
var timeRemaining: Double
//: 10b) Imagine you are writing an app for a credit card company. Declare two entities: creditLimit and balance.

// Solution
let creditLimit: Double
var balance: Double
//: ### Exercise 11
//: Below is the code to reverse a string. Have a look at the entities declared: stringToReverse and reversedString. Choose whether to declare each with let or var. When you're finished uncomment the code and see if the compiler agrees with your choices!
//let or var stringToReverse = "Mutable or Immutable? That is the question." //TODO:Choose let or var
//let or var reversedString = "" //TODO:Choose let or var
//for character in stringToReverse.characters {
//    reversedString = "\(character)" + reversedString
//}
//print(reversedString, terminator: "")

// Solution
 let stringToReverse = "Mutable or Immutable? That is the question."
 var reversedString = ""
 for character in stringToReverse.characters {
     reversedString = "\(character)" + reversedString
 }
print(reversedString, terminator: "")

