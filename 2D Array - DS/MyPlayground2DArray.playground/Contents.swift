import Foundation

// Complete the hourglassSum function below.

func hourglassSum(arr: [[Int]]) -> Int {
    var max = Int.min
    
    for i in 0...arr.count-1 {
        if i == arr.count-2 { break }
        for j in 0...arr.count-1 {
            if j == arr[i].count-2 { break }
            let sunFound = arr[i][j] + arr[i][j+1] + arr[i][j+2] + arr[i+1][j+1] + arr[i+2][j] + arr[i+2][j+1] + arr[i+2][j+2]
            if sunFound > max { max = sunFound }
        }
    }
    
    return max
}


let arr = [[-9, -9, -9,  1, 1, 1],
           [ 0, -9,  0,  4, 3, 2],
           [-9, -9, -9,  1, 2, 3],
           [ 0,  0,  8,  6, 6, 0],
           [ 0,  0,  0, -2, 0, 0],
           [ 0,  0,  1,  2, 4, 0]]

hourglassSum(arr: arr)
