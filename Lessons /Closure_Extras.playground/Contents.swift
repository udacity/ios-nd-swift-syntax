//: Playground - noun: a place where people can play

import UIKit
import Foundation

//: __Problem 6__
//: Katie has a competition going with her old friends from the track team. On her 30th birthday each person tries to match her fastest high school time for the one mile run + 2 seconds for every year since graduation. 

//:Use the map() method to transform the group members' racing times. Using the oldTimes array and the two helper functions provided below, create a new array of String values called goalTimes. Assume it's been 13 years since graduation.

func timeIntervalFromString(timeString: String) -> Int {
    var timeArray = timeString.componentsSeparatedByString(":")
    var minutes = String(timeArray[0]).toInt()!
    var seconds = String(timeArray[1]).toInt()!
    return seconds + (minutes * 60)
}

func timeStringFromInterval(timeInterval: Int) -> NSString {
    var seconds = timeInterval % 60
    var minutes = (timeInterval/60) % 60
    var hours = timeInterval/3600
    return NSString(format: "%.1d:%.2d",minutes,seconds)
}

var oldTimes = ["5:10", "5:45", "5:56", "5:05", "5:23"]

// Solution
var goalTimes = oldTimes.map(){(time: String) -> String in
    var totalSeconds = timeIntervalFromString(time)
    totalSeconds += (13 * 2)
    var goalTimeString = timeStringFromInterval(totalSeconds)
    return goalTimeString as String
}






