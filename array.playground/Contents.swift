import Foundation

struct Str: Equatable {
    var name: String
    
    static func ==(lhs: Str, rhs: Str) -> Bool {
        return lhs.name == rhs.name
    }
}
//extension Collection where Element == Str {
//    func diffIndies(_ items: [Str]) -> [Index] {
//        return self.indices.filter{!items.contains(self[$0])}
//    }
//}

extension Array where Element == Str {
    func diffIndies(_ items: [Str]) -> [Index] {
        return self.indices.filter{!items.contains(self[$0])}
    }
}

let array1: [Str] = [Str(name: "abc"), Str(name: "def"), Str(name: "ghi"), Str(name: "jkl"), Str(name: "xyz"), Str(name: "uhr")]
let array2: [Str] = [Str(name: "ghi"), Str(name: "xyz"), Str(name: "uhr")]

let result = array1.indices.filter{!array2.contains(array1[$0])}
let result2 = array2.diffIndies(array1)
    
print(result)
print(result2)
//
