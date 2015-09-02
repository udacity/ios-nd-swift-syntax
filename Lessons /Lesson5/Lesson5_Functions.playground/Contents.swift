//: # Functions

//: ## Global Functions

var favoriteThings = ["raindrops on roses", "whiskers on kittens", "bright copper kettles"]

contains(favoriteThings, "raindrops on roses")
dropFirst(favoriteThings)

//: ## Methods

//: ## Anatomy of a function

let array = ["A", "13", "B","5","87", "t", "41"]

class Arithmetic {
    func sumOfStrings(aBunchOfStrings: [String]) -> Int {
        let array = aBunchOfStrings
        var sum = 0
        for String in array {
            if String.toInt() != nil {
                let intToAdd = String.toInt()!
                sum += intToAdd
            }
        }
        return sum
    }
}

//:    func functionName (parameterName: parameterType) -> returnType {
//:        statements to execute
//:        return object
//:     }

let stringToReverse = "Mutable or Immutable? That is the question."

func reverseString(stringToReverse: String) {
    var reversedString = ""
    for character in stringToReverse {
        reversedString = "\(character)" + reversedString
    }
    println(reversedString)
}

//:    func functionName (externalParameterName localParameterName: parameterType) -> returnType {
//:        statements to execute
//:        return object
//:     }

//: ## Practice writing function definitions 
//: Example 1 - firstCharacterOf
// TODO: Write the firstCharacterOf function here.
//: Example 2 - placeFirstLetterLast
// TODO: Write placeFirstLetterLast function here. 

//: Example 3 - filterByYear

class MovieArchive {
}

var aiThemedMovies = ["Metropolis":1927, "2001: A Space Odyssey":1968, "Blade Runner":1982, "War Games" : 1983, "Terminator": 1984, "The Matrix":1999, "A.I.":2001, "Her": 2013, "Ex Machina":2015]












