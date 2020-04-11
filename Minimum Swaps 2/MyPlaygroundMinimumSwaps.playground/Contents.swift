import Foundation

func calculateTime(info: String, block : (() -> Void)) {
    let start = DispatchTime.now()
    block()
    let end = DispatchTime.now()
    let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
    let timeInterval = Double(nanoTime) / 1_000_000_000
    print("\n\n\(info) Time: \(timeInterval) seconds\n\n")
}

// Complete the rotLeft function below.
func minimumSwaps(arr: [Int]) -> Int {
    if arr.isEmpty { return 0 }
    var newArr = arr
    var swipes = 0
    var temp = Array(repeating: 0, count: newArr.count+1)
    
    for (index, element) in arr.enumerated() {
        temp[element] = index
    }
    for index in 0...newArr.count-1 {
        if newArr[index] != index+1 {
            swipes+=1
            let t = newArr[index]
            newArr.swapAt(index, temp[index+1])
            temp[t] = temp[index+1]
        }
    }
    return swipes
}

let arr = Array(1...1000).shuffled()
calculateTime(info: "minimumSwaps") { print(minimumSwaps(arr: arr)) }
