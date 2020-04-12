import Foundation

func calculateTime(info: String, block : (() -> Void)) {
    let start = DispatchTime.now()
    block()
    let end = DispatchTime.now()
    let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
    let timeInterval = Double(nanoTime) / 1_000_000_000
    print("\n\n\(info)|Time: \(String(format: "%.4f",timeInterval)) seconds |\n\n")
}

// Complete the rotLeft function below.
func twoStrings(s1: String, s2: String) -> String {
    var letters = [Character:Int]()
    for i in s1 {
        letters[i] = (letters[i] ?? 0) + 1
    }
    for i in s2 {
        if let x = letters[i], x > 0 {
           return "YES"
        }
    }
    return "NO"
}

let s1 = "hello"
let s2 = "world"

let s1no = "hi"
let s2no = "world"

calculateTime(info: "twoStrings s1      ") { print(twoStrings(s1: s1,   s2: s2  )) }
calculateTime(info: "twoStrings s1no    ") { print(twoStrings(s1: s1no, s2: s2no)) }
