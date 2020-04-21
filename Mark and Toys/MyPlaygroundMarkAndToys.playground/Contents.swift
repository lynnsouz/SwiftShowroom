import Foundation

func calculateTime(info: String, block : (() -> Void)) {
    let start = DispatchTime.now()
    block()
    let end = DispatchTime.now()
    let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
    let timeInterval = Double(nanoTime) / 1_000_000_000
    print("\n\(info)|Time: \(String(format: "%.4f",timeInterval)) seconds |")
    print("--------------------------------------------------------------\n")
}
// Complete the countTriplets function below.
func maximumToys(prices: [Int], k: Int) -> Int {
    var qtd = 0
    var rest = k
    let sorted = prices.sorted(by: {$0<$1})
    
    for price in sorted {
        if (rest - price) < 0 {
            break
        }
        rest -= price
        qtd += 1
    }
    
    return qtd
}

let arr = [1, 12, 5, 1110, 200, 1000, 10] // Answer = 4
let k = 50

calculateTime(info: "countTriplets  arr     ") { print(maximumToys(prices: arr, k: k)) }
