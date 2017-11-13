//: [Previous](@previous)
//: ### Extract with Switch
//: To use associated values, they must be extracted. See the following examples for different extraction techniques.
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
//: Most often, associated values are extracted in a switch block. For cases with associated values, the `let` keyword followed by a name will extract the associated value from an enum.
//:
switch filter1 {
case .sepia:
    print("sepia")
case .verticalGradient(let color1, let color2):
    print("vertical gradient with \(color1) and \(color2)")
case .horizontalGradient(let color1, let color2):
    print("horizontal gradient with \(color1) and \(color2)")
case .sketch(let penThickness):
    if let thickness = penThickness {
        print("sketch using \(thickness) thickness")
    } else {
        print("sketch using default thickness")
    }
}
//: If it is possible to treat two cases exactly the same, even with associated values, then you can combine cases. Note, the associated values must be the same types.
//:
switch filter1 {
case .verticalGradient(let color1, let color2), .horizontalGradient(let color1, let color2):
    print("a gradient from \(color1) to \(color2)")
default:
    break
}
//: Associated values can also be extracted as variables using the `var` keyword. Associated values extracted as variables are only available in the case where they are declared.
//:
switch filter1 {
case .horizontalGradient(var color1, let color2):
    color1 = .blue
    print("horizontal gradient with \(color1) and \(color2)")
default:
    break
}
//: - Callout(Watch Out!):
//: Remember, switch statements must be exhaustive or Xcode will complain.
//:
// Uncomment the switch statement below to see Xcode complain about a non-exhaustive switch statement.
/*
switch filter1 {
case .horizontalGradient(var color1, let color2):
    color1 = .blue
    print("horizontal gradient with \(color1) and \(color2)")
}
*/
//: To extract all associated values for a single case as constants, use the `case let` syntax.
//:
switch filter1 {
case let .horizontalGradient(color1, color2):
    print("horizontal gradient with \(color1) and \(color2)")
default:
    break
}
//: If associated values are not needed for computation, they can be ignored. The example below ignores both associated values for the horiztonal gradient.
//:
switch filter1 {
case .horizontalGradient:
    print("the filter is a horizontal gradient!")
default:
    break
}
//: It is also possible to ignore one associated value while extracting another.
//:
switch filter1 {
case .horizontalGradient(let color1, _):
    print("the horizontal gradient's first color is \(color1)")
default:
    break
}
//: - Callout(Watch Out!):
//: Xcode will complain if an associated value is extracted, but not used.
//:
// Comment the print statement with `color1` to see Xcode complain about an unused associated value.
switch filter1 {
case .horizontalGradient(let color1, _):
    print("a horizontal gradient with...")
    print("\(color1)")
default:
    break
}
//: Because switch statements use pattern matching, complex matches are possible with the `where` keyword.
//:
switch filter1 {
case .horizontalGradient(let color1, _) where color1 == .white:
    print("the horizontal gradient's first color is white")
case .horizontalGradient(_, let color2) where color2 == .black:
    print("the horizontal gradient's second color is black")
default:
    break
}
//: [Next](@next)
