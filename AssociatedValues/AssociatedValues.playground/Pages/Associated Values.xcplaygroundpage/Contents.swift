//: [Previous](@previous)
//: ### Associated Values
//: Associated values are defined alongside enum cases. Associated values are not required; some enum cases may have associated values while others do not. In the example below, `LibraryFee` has three cases with associated values and a case without an associated value.
//:
enum LibraryFee {
    case overdueBook(Int)
    case lostBook(Double)
    case lostLibraryCard(Int)
    case annualDues
}

let fee = LibraryFee.overdueBook(4)
//: It can be very helpful to name associated values so that their intent is easily understood.
//:
enum DescriptiveLibraryFee {
    case overdueBook(days: Int)
    case lostBook(price: Double)
    case lostLibraryCard(timesLost: Int)
    case annualDues
}

let weekLateFee = DescriptiveLibraryFee.overdueBook(days: 7)
//: - Callout(Watch Out!):
//: If all enums cases have a single associated value of the same type, consider using a raw value instead.
//:
// the associated values for `PlaySpeedAssociated` should be raw values
enum PlaySpeedAssociated {
    case slow(value: Int)
    case normal(value: Int)
    case fast(value: Int)
    case custom(value: Int)
}

enum PlaySpeedRaw: Int {
    case slow, normal, fast, custom
}
//: It is possible to define multiple associated values for a single case. This makes more apparent that behind the scenes, Swift represents associated values as tuples. Recall from [Apple's documentation](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html#//apple_ref/doc/uid/TP40014097-CH5-ID329), tuples are multiple values grouped into a single compound value.
//:
import UIKit

enum ImageFilter {
    case sepia
    case verticalGradient(from: UIColor, to: UIColor)
    case horizontalGradient(from: UIColor, to: UIColor)
    case sketch(penThickness: Double?)
}

let fadeToBlack = ImageFilter.horizontalGradient(from: .gray, to: .black)
//: [Next](@next)
