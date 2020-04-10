import Foundation

// Complete the rotLeft function below.

func rotLeft(a: [Int], d: Int) -> [Int] {
    if d <= 0 || d == a.count || a.isEmpty { return a }
    var arr = a
    for _ in 0...d-1 {
        arr.append(arr[0])
        arr.remove(at: 0)
    }
    
    return arr
}

let arr = [1, 2, 3, 4, 5]
let first = rotLeft(a: arr, d: 5)
let second = rotLeft(a: first, d: 4)

