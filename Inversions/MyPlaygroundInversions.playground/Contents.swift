import Foundation

func maxInversions(arr: [Int]) -> Int {
    // Write your code here
    if arr.count == 0 { return 0 }
    var totalCount = 0
    let n = arr.count-1
    for i in 1...n {
        
        var a = 0
        for j in i...n {
            if arr[i] > arr[j] {
                a += 1
            }
        }
        
        var b = 0
        for j in (0...i-1).reversed() {
            if arr[i] < arr[j] {
                b += 1
            }
        }
        totalCount += b*a
    }
    return totalCount
}

maxInversions(arr: [])
maxInversions(arr: [4,2,2,1])           //2
maxInversions(arr: [4,4,2,2,1])         //4
maxInversions(arr: [5,3,4,2,1])         //7
maxInversions(arr: [15, 10, 1, 7, 8])   //3
maxInversions(arr: [5,10,7,4,5,11])     //2

