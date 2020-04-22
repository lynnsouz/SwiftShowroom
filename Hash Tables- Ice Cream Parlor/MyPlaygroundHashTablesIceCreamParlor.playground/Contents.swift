import Foundation

func calculateTime(info: String, block : (() -> Void)) {
    let start = DispatchTime.now()
    block()
    let end = DispatchTime.now()
    let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
    let timeInterval = Double(nanoTime) / 1_000_000_000
    print("\n\(info)|Time: \(String(format: "%.5f",timeInterval)) seconds |")
    print("--------------------------------------------------------------\n")
}
// Complete the countTriplets function below.
func whatFlavors(cost: [Int], money: Int) -> Void {
    var map = [Int:Int]()
    for (pos, cost) in cost.enumerated() {
        let compliment = money - cost
        if map[compliment] != nil {
            print (map[compliment]!, pos + 1)
            return
        } else {
            map[cost] = pos + 1
        }
    }
}

var arr = [1,4,5,3,2] // Answer = 1 4
let money = 4
var arr2 = [2,2,4,3] // Answer = 1 2
let money2 = 4


calculateTime(info: "countTriplets  arr     ") { whatFlavors(cost: arr,   money: money    ) }
calculateTime(info: "countTriplets  arr2    ") { whatFlavors(cost: arr2,  money: money2   ) }
