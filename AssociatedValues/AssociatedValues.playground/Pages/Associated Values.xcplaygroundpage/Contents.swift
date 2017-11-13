//: [Previous](@previous)
//: ### Associated Values
//: Associated values are defined alongside enum cases. Associated values are not required, and some cases may have associated values while others do not. In the example below, `LibraryFee` has three cases with associated values and a case without an associated value.
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
//: If all enums cases have a single associated value of the same type, consider using a raw value instead.
//:
enum PlaySpeedAssociated {
    case slow(value: Int)
    case normal(value: Int)
    case fast(value: Int)
    case custom(value: Int)
}

enum PlaySpeedRaw: Int {
    case slow, normal, fast, custom
}
//: It is possible to define multiple associated values for a single case.
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
