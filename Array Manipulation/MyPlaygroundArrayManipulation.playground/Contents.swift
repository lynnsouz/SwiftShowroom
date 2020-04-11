import Foundation

func calculateTime(info: String, block : (() -> Void)) {
    let start = DispatchTime.now()
    block()
    let end = DispatchTime.now()
    let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
    let timeInterval = Double(nanoTime) / 1_000_000_000
    print("\n\n\(info) Time: \(String(format: "%.02f", timeInterval)) seconds\n\n")
}

/*
func arrayManipulation1(n: Int, queries: [[Int]]) -> Int {
    var arr = Array(repeating: 0, count: n+1)
    var max = 0
    
    for line in queries {
        for i in line[0]...line[1] {
            arr[i] += line[2]
            if max < arr[i] {
                max = arr[i]
            }
        }
    }
    
    return max
} */

// Complete the rotLeft function below.
func arrayManipulation(n: Int, queries: [[Int]]) -> Int {
    let initial = 0
    var arr = Array(repeating: initial, count: n+1)
    var sumArr = Array(repeating: initial, count: n+1)
    
    for line in queries {
        sumArr[line[0]-1] += line[2]
        sumArr[line[1]] -= line[2]
    }
    
    for i in 0...arr.count-2 {
        arr[i+1] += arr[i] + sumArr[i]
    }

    return arr.max() ?? initial
}

calculateTime(info: "arrayManipulation") { print(arrayManipulation(n: 4, queries: [[2,3,603],[1,1,286],[4,4,882]])) }

//calculateTime(info: "arrayManipulation") { print(arrayManipulation(n: 10, queries: [[2,6,8],[3,5,7],[1,8,1],[5,9,15]])) }


