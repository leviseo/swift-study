import UIKit

struct SelectedItem: Codable {
    var seq: Int
    var title: String
}

var test = SelectedItem(seq: 1, title: "바뀌기 전")

test.seq = 2
test.title = "바뀐 후"


let data = try! JSONEncoder().encode(test)
let result = String(data: data, encoding: .utf8)

print(result)
