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
func activityNotifications(expenditure: [Int], d: Int) -> Int {
    var notifications = 0
    var freq = Array(repeating: 0, count: 201)
    
    // Init
    for i in expenditure[0..<d] {
        freq[i] += 1
    }
    
    for i in d..<expenditure.count {
        let newValue = expenditure[i]
        let oldValue = expenditure[i-d]
        
        if expenditure[i] >= median(freq, d) {
            notifications += 1
        }
        
        if newValue != oldValue {
            freq[newValue] += 1
            freq[oldValue] -= 1
        }
    }
    
    return notifications
}
func median(_ freq: [Int], _ d: Int) -> Int {
    var count = 0
    
    if d % 2 == 0 { // Media
        for (key, value) in freq.enumerated() {
            count += value
            if count >= d / 2 {
                if count >= (d / 2) + 1 { return key * 2 }
                else {
                    for i in key+1...freq.count {
                        if freq[i] > 0 { return key + i }
                    }
                }
            }
        }
    } else { // Middle value
        for (key, value) in freq.enumerated() {
            count += value
            if count >= (d + 1) / 2 { return key * 2 }
        }
    }
    
    return 1 // Default... meaningless
}

let expenditure = [2, 3, 4, 2, 3, 6, 8, 4, 5] // Answer = 2
let d = 5

let expenditure1 = [10, 20, 30, 40, 50] // Answer = 1
let d1 = 3

let expenditure0 = [1, 2, 3, 4, 4] // Answer = 0
let d0 = 4

calculateTime(info: "activityNotifications  expenditure     ") { print(activityNotifications(expenditure: expenditure   , d: d  )) }
calculateTime(info: "activityNotifications  expenditure1    ") { print(activityNotifications(expenditure: expenditure1  , d: d1 )) }
calculateTime(info: "activityNotifications  expenditure0    ") { print(activityNotifications(expenditure: expenditure0  , d: d0 )) }
