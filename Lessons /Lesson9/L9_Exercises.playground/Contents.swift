//: ## Lesson 9 Exercises - Closures
import UIKit
//: __Problems 1&2__
//:
//: In the code snippets below find two sorted arrays. For each:
//:
//:__a.__
//:Create a new array sorted in the reverse order.
//:
//:__b.__
//:Rewrite the sorting closure expression to be as concise as possible.
// 1
var surnames = ["Silverman", "Fey", "Whig", "Schumer", "Kaling"]
let orderedSurnames = surnames.sort({(name1: String, name2: String) -> Bool in
    return name2 > name1
})

// 2
let battingAverages = [0.302, 0.556, 0.280, 0.500, 0.281, 0.285]
let sortedAverages = battingAverages.sort({(average1: Double, average2: Double) -> Bool in
    return average2 > average1
})

//: __Problem 3__
//:
//: The following code snippet filters an array for all of the numbers which are divisible by 3.
let numbers = [685, 1728, 648, 87, 979, 59175432]
let divisibleByThree = numbers.filter({(number: Int) -> Bool in
    number % 3 == 0
})

//: __3a.__
//:Filter the following array for the numbers which are divisible by 12.
let numbersAsStrings = ["685", "1728", "648", "87", "979", "59175432"]

//: __3b.__
//: Rewrite the filtering closure expression to be as concise as possible.

//: __Problem 4__
//:
//: Filtering out particles greater that 20 microns has been shown to reduce exposure to waterborne pathogens. Filter the following array for all of the particles below 20 microns in size. Assign the result to a new array.
let particleSizesInMicrons = [150, 16, 82, 30, 10, 57]

//: __Problem 5__
//:
//: The Array method, map, takes a closure expression as an argument.  The closure is applied to each element in the Array, the results are mapped to a new Array, and that new Array is returned.
//: In the example below each element in the particleSizeInMicrons array is incorporated into a String to which  units are added.
// Example
let sizesAsStrings = particleSizesInMicrons.map({ (size: Int) -> String in
    return "\(size) microns"
})
//: Ben just got back from India and he is tallying what he spent on gifts for his customs form.
//: Use the map() method to transform this array of prices into dollars. Round to the nearest dollar.
let pricesInRupees = [750, 825, 2000, 725]

//: __Problem 6__
//:
//: Katie has a competition going with her old friends from the track team. Each person tries to match her fastest high school time for the 1600m run + 1 second for every year since graduation.
//:
//:Use the map() method to transform the group members' racing times. Using the oldTimes array and the two helper functions provided below, create a new array of String values called goalTimes. Assume it's been 13 years since graduation.

func timeIntervalFromString(timeString: String) -> Int {
    var timeArray = timeString.componentsSeparatedByString(":")
    let minutes = Int(String(timeArray[0]))!
    let seconds = Int(String(timeArray[1]))!
    return seconds + (minutes * 60)
}

func timeStringFromInterval(timeInterval: Int) -> NSString {
    let seconds = timeInterval % 60
    let minutes = (timeInterval/60) % 60
    return NSString(format: "%.1d:%.2d",minutes,seconds)
}

var oldTimes = ["5:18", "5:45", "5:56", "5:25", "5:27"]
