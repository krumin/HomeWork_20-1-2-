import UIKit

let serialQueue = DispatchQueue(label: "my queue")
let group = DispatchGroup()

var number = 65
print("start number = \(number)")

group.enter()
serialQueue.asyncAfter(deadline: .now() + 3) {
  number += 3
  print("operation += 3: number = \(number)")
  group.leave()
}

group.enter()
serialQueue.asyncAfter(deadline: .now() + 1) {
  number *= 7
  print("operation *= 7: number = \(number)")
  group.leave()
}

group.enter()
serialQueue.asyncAfter(deadline: .now() + 2) {
  number -= 4
  print("operation -= 4: number = \(number)")
  group.leave()
}

group.notify(queue: .main) {
  print("finish number = \(number)")
}




