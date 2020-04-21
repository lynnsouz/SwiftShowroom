import Foundation

func calculateTime(info: String, block : (() -> Void)) {
    let start = DispatchTime.now()
    block()
    let end = DispatchTime.now()
    let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
    let timeInterval = Double(nanoTime) / 1_000_000_000
    print("\n\(info)|Time: \(String(format: "%.5f",timeInterval)) seconds |")
    print("--------------------------------------------------------------\n")
}
// Complete the countTriplets function below.
func countInversions(arr: inout [Int]) -> Int {
    var aux = arr
    return countInversions(&arr, lo: 0, hi: arr.count-1, aux: &aux)
}
func countInversions(_ arr: inout [Int], lo: Int, hi: Int, aux: inout [Int]) -> Int {
    if lo >= hi { return 0 }
    let mid = lo + (hi - lo) / 2
    return countInversions(&aux, lo: lo, hi: mid, aux: &arr) + countInversions(&aux, lo: mid+1, hi: hi, aux: &arr) + merge(&arr, lo: lo, mid: mid, hi: hi, aux: &aux)
}

func merge(_ arr: inout [Int], lo: Int, mid: Int, hi: Int, aux: inout [Int]) -> Int {
    var count = 0, i = lo, j = mid + 1,  k = lo
    
    while i <= mid || j <= hi {
        if i > mid {
            arr[k] = aux[j]
            j+=1
        } else if j > hi {
            arr[k] = aux[i]
            i+=1
        } else if aux[i] <= aux[j] {
            arr[k] = aux[i]
            i+=1
        } else {
            arr[k] = aux[j]
            j+=1
            count += mid + 1 - i
        }
        k+=1
    }
    
    return count
}

var arr = [1,1,1,2,2] // Answer = 0
var arr4 = [2,1,3,1,2] // Answer = 4


calculateTime(info: "countTriplets  arr     ") { print(countInversions(arr: &arr     )) }
calculateTime(info: "countTriplets  arr4    ") { print(countInversions(arr: &arr4    )) }
