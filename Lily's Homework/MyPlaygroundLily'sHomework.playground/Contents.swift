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
func lilysHomework(arr: [Int]) -> Int {
    let asc = arr.sorted()
    let desc = arr.sorted(by: >)
  
    var tempAsc     = [Int]()
    var tempDesc    = [Int]()
    for i in arr.indices {
        if arr[i] != asc[i] {
            tempAsc.append(arr[i])
        }
        if arr[i] != desc[i] {
            tempDesc.append(arr[i])
        }
    }
    return min(countSwaps(arr: &tempAsc), countSwaps(arr: &tempDesc, reverse: true))
}
func countSwaps(arr: inout [Int], reverse: Bool = false) -> Int {
    var swaps = 0
    let sorted = reverse ? arr.sorted(by: >) : arr.sorted()
    var pos = Dictionary<Int, Int>(uniqueKeysWithValues: zip(arr, arr.indices))
    
    for i in arr.indices {
        if arr[i] != sorted[i] {
            swaps += 1
            
            let sortedindex = pos[sorted[i]]!
            pos[arr[i]] = sortedindex
            arr[sortedindex] = arr[i]
            arr[i] = sorted[i]
        }
    }
    
    return swaps
}
let arr = [2, 5, 3, 1] // Answer = 2

let arr2 = [3, 4, 2, 5, 1] // Answer = 2

calculateTime(info: "lilysHomework  arr     ") { print(lilysHomework(arr: arr   )) }
calculateTime(info: "lilysHomework  arr2    ") { print(lilysHomework(arr: arr2  )) }

