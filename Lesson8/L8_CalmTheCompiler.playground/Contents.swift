//: ### Calm the compiler
// Problem 1
protocol DirtyDeeds {
    func cheat()
    func steal()
}

class Minion: DirtyDeeds {
    var name: String
    
    init(name:String) {
        self.name =  name
    }
}

// Problem 2
class DinnerCrew {
    var members: [Souschef]
    
    init(members: [Souschef]) {
        self.members = members
    }
}

protocol Souschef {
    func chop(_ vegetable: String) -> String
    func rinse(_ vegetable:String) -> String
}

var deviousDinnerCrew = DinnerCrew(members: [Minion]())

// Problem 3
protocol DogWalker {
    func throwBall(_ numberOfTimes:Int) -> Int
    func rubBelly()
}

class Neighbor: DogWalker {
    
    func throwBall(_ numberOfTimes:Int) {
        var count = 0
        while count < numberOfTimes {
            print("Go get it!")
            count += 1
        }
    }
    
    func rubBelly() {
        print("Rub rub")
    }
}
