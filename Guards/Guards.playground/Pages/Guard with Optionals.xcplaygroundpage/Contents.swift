//: [Previous](@previous)
//: ### Guards with Optionals
//: Guards can specify conditions involving optionals using the `guard let` syntax. `guard let` checks for the existance of a value (non-nil) while safetly binding and storing it into a constant. If the value is nil, then the condition fails. If the value is non-nil, then the condition is met and the value is stored and usable as a constant in the rest of the scope where the guard statement appears.
//:
func takeOff(passengersSeated: Bool, crewReady: Bool, runwayClear: Bool, crewLeader: String?) {
    guard passengersSeated, crewReady, runwayClear else { return }
    
    // check: is the crew leader non nil?
    guard let crewLeader = crewLeader else { return }

    // the crew leader is available throughout this function
    print("\(crewLeader): \"Takeoff checks complete!\"")
    print("✈️ Lifts off runway")
}

takeOff(passengersSeated: true, crewReady: true, runwayClear: true, crewLeader: "👩🏻‍✈️ Natalie")
//: - Callout(Watch Out!):
//: It is not possible to reuse a name from a `guard let` statement in the same local scope.
//:
func takeOffNameConflict(passengersSeated: Bool, crewReady: Bool, runwayClear: Bool, crewLeader: String?) {
    guard passengersSeated, crewReady, runwayClear else { return }
    guard let crewLeader = crewLeader else { return }
    
    // let crewLeader = "James" /* "crewLeader" has already been used in the guard statement */
    print("\(crewLeader): \"Takeoff checks complete!\"")
    print("✈️ Lifts off runway")
}
//: - Callout(Watch Out!):
//: Names defined in a guard condition are not available in the guard's body.
//:
func takeOffNameInBody(passengersSeated: Bool, crewReady: Bool, runwayClear: Bool, crewLeader: String?) {
    guard passengersSeated, crewReady, runwayClear else { return }
    guard let crewLeader = crewLeader else {
        // print("\(crewLeader) is nil") /* cannot use the crew leader here! */
        return
    }
    
    print("\(crewLeader): \"Takeoff checks complete!\"")
    print("✈️ Lifts off runway")
}
//: It is also possible to use `guard var`, but it is less common. With `guard var` the optional is bound and able to be changed.
//:
func takeOffGuardVar(passengersSeated: Bool, crewReady: Bool, runwayClear: Bool, crewLeader: String?) {
    guard passengersSeated, crewReady, runwayClear else { return }
    guard var crewLeader = crewLeader else { return }
    
    // modify the crew leader
    crewLeader = crewLeader.uppercased()
    
    print("\(crewLeader): \"Takeoff checks complete!\"")
    print("✈️ Lifts off runway")
}

takeOffGuardVar(passengersSeated: true, crewReady: true, runwayClear: true, crewLeader: "👩🏻‍✈️ Natalie")
//: [Next](@next)
