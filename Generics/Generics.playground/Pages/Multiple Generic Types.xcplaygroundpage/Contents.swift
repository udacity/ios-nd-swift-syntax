//: [Previous](@previous)
//: ### Multiple Generic Types
//: Generic functions and types can specify multiple generic types, simply use a comma to separate them.
//:
// `Type1` and `Type2` can represent any type
func printCombineTypesOf<Type1, Type2>(a: Type1, b: Type2) {
    print("\(type(of: a))\(type(of: b))")
}

printCombineTypesOf(a: "abc", b: 4)
printCombineTypesOf(a: 3, b: false)
printCombineTypesOf(a: "ios", b: "android")
//: With multiple generic types, the same rules apply for generic constraints.
//:
// `Type1` must implement the `UnsignedInteger` protocol
func combineUInt<Type1: UnsignedInteger, Type2>(_ int: Type1, withString string: Type2) -> String {
    return "\(int) \(string)"
}

let unsignedInt: UInt = 4
print(combineUInt(unsignedInt, withString: "zebras"))

// the first argument must be a type which implements `UnsignedInteger`
//combineUInt(4, withString: "horses")
//: Below, is an example with multiple generic types called `DualExhibit`. Note, this is just a teaching example; in practice, an implementation for `DualExhibit` might differ based on application needs.
//:
protocol Animal {
    var name: String { get }
    static var commonName: String { get }
    static var emoji: String { get }
}

struct Zebra: Animal {
    let name: String
    static let commonName = "Zebra"
    static let emoji = "🦓"
}

struct Squid: Animal {
    let name: String
    static let commonName = "Squid"
    static let emoji = "🦑"
}

struct DualExhibit<A1: Animal, A2: Animal> {
    let group1: [A1]
    let group2: [A2]
    
    func tourTheExhibit() {
        print("Welcome to this shared exhibit. Here you can see \(A1.commonName) \(A1.emoji) and \(A2.commonName) \(A2.emoji)!")
        for animal in group1 { print("Say hello to \(animal.name) \(A1.emoji).") }
        for animal in group2 { print("Say hello to \(animal.name) \(A2.emoji).") }
    }
}

let exhibit1 = DualExhibit(
    group1: [Zebra(name: "Sheila"), Zebra(name: "Zeek")],
    group2: [Squid(name: "Phil"), Squid(name: "Phineas")]
)
exhibit1.tourTheExhibit()

// the verbose initialization syntax can still be used
let exhibit2 = DualExhibit<Zebra, Squid>(
    group1: [Zebra(name: "Zelda"), Zebra(name: "Zach")],
    group2: [Squid(name: "Spongebob"), Squid(name: "Patrick")]
)
exhibit2.tourTheExhibit()
