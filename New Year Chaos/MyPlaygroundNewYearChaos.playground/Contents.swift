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
func minimumBribes(q: [Int]) -> Void {
    var moves = 0
    for i in 0..<q.count {
        if q[i] - (i+1) > 2 {
            print("Too chaotic")
            return
        }
        for j in max(q[i]-3, 0)...i {
            if q[j] > q[i] {
                moves += 1
            }
        }
    }
    print(moves)
}

let arr = [1, 2, 5, 3, 7, 8, 6, 4]
let arrChaotic = [2,5,1,3,4]
calculateTime(info: "minimumBribes arr          ") { minimumBribes(q: arr)            }
calculateTime(info: "minimumBribes arrChaotic   ") { minimumBribes(q: arrChaotic)     }
