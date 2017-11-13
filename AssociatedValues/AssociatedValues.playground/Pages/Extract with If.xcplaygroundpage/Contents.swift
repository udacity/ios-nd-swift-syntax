//: [Previous](@previous)
//: ### Extract with If
//: Using a switch statement can be cumbersome if only a single case needs to be checked and extracted. To extract associated values for a single case, use `if case`.
//:
import UIKit

enum ImageFilter {
    case sepia
    case verticalGradient(from: UIColor, to: UIColor)
    case horizontalGradient(from: UIColor, to: UIColor)
    case sketch(penThickness: Double?)
}

let filter1 = ImageFilter.horizontalGradient(from: .gray, to: .black)
let filter2 = ImageFilter.horizontalGradient(from: .white, to: .black)
//: `if case` behaves like a case statement in a switch block.
//:
if case ImageFilter.horizontalGradient(let color1, var color2) = filter1 {
    color2 = .red
    print("horizontal gradient with \(color1) and \(color2)")
}
//: To extract all associated values as constants use `if case let`.
//:
if case let ImageFilter.horizontalGradient(color1, color2) = filter1 {
    print("horizontal gradient with \(color1) and \(color2)")
}
//: Complex conditionals can be formed using `if case` and conditional statements separated by commas.
//:
if case let ImageFilter.horizontalGradient(_, color2) = filter1, color2 == .black {
    print("the horizontal gradient's second color is black")
}
//: To learn more about extraction techniques, read [Pattern Matching, Part 4: if case, guard case, for case](http://alisoftware.github.io/swift/pattern-matching/2016/05/16/pattern-matching-4/) on Crunchy Development.
//:
//: [Next](@next)
