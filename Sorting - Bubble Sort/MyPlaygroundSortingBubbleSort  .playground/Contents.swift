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
func countSwaps(a: [Int]) -> Void {
    var array = a
    var swaps = 0
    
    for i in 0..<array.count {
        for j in 1..<array.count-i {
            if array[j] < array[j-1] {
                let tmp = array[j-1]
                array[j-1] = array[j]
                array[j] = tmp
                swaps += 1
            }
        }
    }
    print("Array is sorted in \(swaps) swaps.")
    print("First Element: \(array.first ?? 0)")
    print("Last Element: \(array.last ?? 0)")
}

let arr0 = [1,2,3] // Answer = 0
let arr3 = [3,2,1] // Answer = 3

calculateTime(info: "countSwaps arr0    ") { countSwaps(a: arr0) }
calculateTime(info: "countSwaps arr3    ") { countSwaps(a: arr3) }
