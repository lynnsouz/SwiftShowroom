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
func sherlockAndAnagrams(s: String) -> Int {
    let chars = Array(s)
    var nAnagrams = 0
    for length in 0...chars.count-2 {
        var counter:[String:Int] = [:]
        for i in 0..<chars.count - length {
            let txt = String(chars[i...i+length].sorted())
            counter[txt] = (counter[txt] ?? 0) + 1
        }
        for c in counter {
            nAnagrams += c.value * (c.value - 1)/2
        }
    }
    return nAnagrams
}

let zero = "abcd"
let three = "ifailuhkqq"
let four = "abba"
let ten = "kkkk"

calculateTime(info: "sherlockAndAnagrams  zero  ") { print(sherlockAndAnagrams(s: zero  ))   }
calculateTime(info: "sherlockAndAnagrams  three ") { print(sherlockAndAnagrams(s: three ))   }
calculateTime(info: "sherlockAndAnagrams  four  ") { print(sherlockAndAnagrams(s: four  ))   }
calculateTime(info: "sherlockAndAnagrams  ten   ") { print(sherlockAndAnagrams(s: ten   ))   }
