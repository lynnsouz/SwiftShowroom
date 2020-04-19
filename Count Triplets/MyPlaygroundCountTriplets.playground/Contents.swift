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
func countTriplets(arr: [Int], r: Int) -> Int {
    var m2 = [Int:Int]()
    var m3 = [Int:Int]()
    var count = 0
    
    for n in arr {
        let i = n*r
        m3[n] = m3[n] ?? 0
        m3[i] = m3[i] ?? 0
        m2[n] = m2[n] ?? 0
        m2[i] = m2[i] ?? 0
        
        count += m3[n]!
        m3[i] = m3[i]! + m2[n]!
        m2[i] = m2[i]! + 1
        
    }
    return count
}

let arr = [1, 5, 5, 25, 125] // Answer = 4
let r = 5

let arr2 = [1,2,2,4] // Answer = 2
let r2 = 2

calculateTime(info: "countTriplets  arr     ") { print(countTriplets(arr: arr, r: r)) }
calculateTime(info: "countTriplets  arr2    ") { print(countTriplets(arr: arr2, r: r2)) }
