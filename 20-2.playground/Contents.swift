import UIKit

struct Number {
  var numberOne: Int
  var numbetTwo: Int
  
}

var numbers = Number(numberOne: 50, numbetTwo: 20)
print("start numbers \(numbers.numberOne) : \(numbers.numbetTwo)")

let concurrentQueue = DispatchQueue(label: "my cuncurrnet queue", qos: .default, attributes: .concurrent)

let group = DispatchGroup()

group.enter()
concurrentQueue.asyncAfter(deadline: .now() + 2) {
  numbers.numberOne += 10
  numbers.numbetTwo -= 2
  print("operation +10 = \(numbers.numberOne), operation -2 = \(numbers.numbetTwo)")
  group.leave()
}

group.enter()
concurrentQueue.asyncAfter(deadline: .now() + 3) {
  numbers.numberOne += 7
  numbers.numbetTwo *= 15
  print("operation +7 = \(numbers.numberOne), operation *15 = \(numbers.numbetTwo)")
  group.leave()
}

group.enter()
concurrentQueue.asyncAfter(deadline: .now() + 1) {
  numbers.numberOne += 4
  numbers.numbetTwo /= 2
  print("operation +4 = \(numbers.numberOne), operation /2 = \(numbers.numbetTwo)")
  group.leave()
}

group.notify(queue: .main) {
  let sum = numbers.numberOne + numbers.numbetTwo
  print("finish sum = \(sum)")
}
