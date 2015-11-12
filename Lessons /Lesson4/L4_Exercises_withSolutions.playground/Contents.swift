//: # Lesson 4 Exercises - Control Flow

import UIKit

//: ## Fast enumeration with for-in
//: ### Exercise 1
//: For each title in the array print the following string: "title + with Puppets", e.g "Point Break with Puppets!"
var movieTitleArray = ["Point Break", "The Dark Knight", "Star Wars", "When Harry Met Sally"]

// Solution
for title in movieTitleArray {
    print("\(title) with Puppets!")
}
//: ### Exercise 2
//: Rent is increasing by 20% this year. Use a for-in loop to apply this increase to each item in the oldMountainViewRent array.  Store the new values in the array newMountainViewRent.
var oldMountainViewRent:[Double] = [2150, 1775, 2221, 1261, 1325, 2110, 1870]
var newMountainViewRent = [Double]()

// Solution
for rent in oldMountainViewRent {
    newMountainViewRent.append(rent * 1.20)
}
print(newMountainViewRent)
//: ### Exercise 3
//: For each food with a true value, print out "<food>, yum!" For each food with a false value, print out "<food>, yuck!"
var polarizingFoods = ["Anchovies":true, "Coconut":true, "Cilantro":true, "Liver": false]

// Solution
for (food, preference) in polarizingFoods {
    if preference {
        print("\(food), yum!")
    } else {
        print("\(food), yuck!")
    }
}
//: ### Exercise 4
//: The Oakland area code is changing from 415 to 510. Replace all occurrences of the area code 415 with 510 in the dictionary below.
var rapperPhoneNumbers = ["Azealia Banks":"(212)548-8777", "Boots Riley":"(415)755-9887", "MC Hammer":"(415)533-9899", "Missy Elliot":"(757)488-5552", "Shock G":"(415)499-7676", "Sir Mix-a-lot":"(206)123-4567", "Snoop Dogg":"(213)760-6664"]

// Solution
for (name, digits) in rapperPhoneNumbers {
    rapperPhoneNumbers[name] = digits.stringByReplacingOccurrencesOfString("(415)", withString: "(510)")
}

//: ## Switch Statements
//: Translate the following if-else statements into switch statements. Feel free to modify print statements as desired.
//: ### Exercise 5
// Below is an if statement determining what team to cheer for given a sport.
enum Sport {
    case Baseball, Basketball, Football, Hockey, Soccer
}

var sport = Sport.Baseball

if sport == .Baseball {
    print("Go A's!")
} else if sport == .Basketball {
    print("Go Warriors!")
} else if sport == .Football {
    print( "Go Raiders!")
} else if sport == .Hockey {
    print("Go Sharks!")
} else if sport == .Soccer {
    print("Go Earthquakes!")
} else {
    print("Go Team!")
}

// Solution
switch sport {
case .Baseball:
    print("Go A's!")
case .Basketball:
    print("Go Warriors!")
case .Football:
    print("Go Raiders!")
case .Hockey:
    print("Go Sharks!")
case .Soccer:
    print("Go Earthquakes")
}
//: ### Exercise 6
// Below is an enum and an if-else statement for implementing the game Rock-Paper-Scissors.
enum roshamboMove {
    case Rock, Paper, Scissors
}

var myMove = roshamboMove.Scissors
var yourMove = roshamboMove.Scissors

var resultsMessage = ""

if myMove == .Rock && yourMove == .Paper || myMove == .Paper && yourMove == .Rock {
    resultsMessage = "Paper covers Rock."
} else if myMove == yourMove {
    resultsMessage = "It's a tie!"
} else if myMove == .Rock && yourMove == .Scissors || myMove == .Scissors && yourMove == .Rock {
    resultsMessage = "Rock crushes Scissors. "
} else if myMove == .Paper && yourMove == .Scissors || myMove == .Scissors && yourMove == .Paper {
    resultsMessage = "Scissors cut Paper."
} 

// Solution
switch (myMove, yourMove) {
case (.Rock, .Paper), (.Paper, .Rock):
    resultsMessage = "Paper covers Rock."
case (.Rock, .Rock), (.Paper, .Paper), (.Scissors, .Scissors):
    resultsMessage = "It's a tie!"
case (.Rock, .Scissors), (.Scissors, .Rock):
    resultsMessage = "Rock crushes Scissors."
case (.Paper, .Scissors), (.Scissors, .Paper):
    resultsMessage = "Scissors cut Paper."
}

// Alternate solution
switch (myMove, yourMove) {
case (.Rock, .Paper), (.Paper, .Rock):
    resultsMessage = "Paper covers Rock."
case let (a, b) where a==b :
    resultsMessage = "It's a tie!"
case (.Rock, .Scissors), (.Scissors, .Rock):
    resultsMessage = "Rock crushes Scissors."
case (.Paper, .Scissors), (.Scissors, .Paper):
    resultsMessage = "Scissors cut Paper."
default:
    resultsMessage = "Paper covers Rock."
}


//: ### Exercise 7
//: Below is an if-else statement matching an assignment score to a letter grade.
var score = 97
var letterGrade = ""

if 90...100 ~= score {
    letterGrade = "A"
} else if 80...89 ~= score {
    letterGrade = "B"
} else if 70...79 ~= score {
    letterGrade = "C"
} else if 60...69 ~= score {
    letterGrade = "D"
} else {
    letterGrade = "Incomplete"
}

// Solution
switch score {
case 90...100:
    letterGrade = "A"
case 80...89:
    letterGrade = "B"
case 70...79:
    letterGrade = "C"
case 60...69:
    letterGrade = "D"
default:
    letterGrade = "Incomplete"
}
//: ### Exercise 8
//: The if-else statement below translates a word into Pig Latin. Without using the "vowels" array, write an equivalent switch statement.

var word = "can"
var firstLetter = Array(word.characters)[0]
var newWord = ""
var vowels: [Character] = ["a", "e", "i", "o", "u"]

if vowels.contains(firstLetter) {
    newWord = word + "yay"
} else {
    word.removeAtIndex(word.startIndex)
    newWord = "\(word)\(firstLetter)ay"
}

// Solution
switch firstLetter {
case "a", "e", "i", "o", "u":
    newWord = word + "yay"
default:
    word.removeAtIndex(word.startIndex)
    newWord = "\(word)\(firstLetter)ay"
}
