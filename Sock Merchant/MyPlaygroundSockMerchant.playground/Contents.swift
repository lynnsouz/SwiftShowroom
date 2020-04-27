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
func sockMerchant(n: Int, ar: [Int]) -> Int {
    var count = 0
    var qtd = [Int:Int]()
    
    for i in ar {
        qtd[i] =  (qtd[i] ?? 0) + 1
        if qtd[i]!%2 == 0 {
            count+=1
        }
    }

    return count
}

let arr = [10, 20, 20, 10, 10, 30, 50, 10, 20] // Answer = 3
let n = 9

calculateTime(info: "sockMerchant  arr     ") { print(sockMerchant(n: n, ar: arr)) }


