import Foundation

func calculateTime(info: String, block : (() -> Void)) {
    let start = DispatchTime.now()
    block()
    let end = DispatchTime.now()
    let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
    let timeInterval = Double(nanoTime) / 1_000_000_000
    print("\n\n\(info)|Time: \(String(format: "%.4f",timeInterval)) seconds |\n\n")
}

func freqQueryTL(queries: [[Int]]) -> [Int] { // I was getting time limmit.
    var freq = [Int:Int]()
    var outputArr = [Int]()
    for i in 0..<queries.count {
        guard let querry = queries[i].first, let number = queries[i].last else { break }
        switch querry {
            case 1: // - 1 x : Insert x in your data structure.
                freq[number] = (freq[number] ?? 0) + 1
                break
            case 2: // - 2 y : Delete one occurence of y from your data structure, if present.
                if let freqOfNumber = freq[number], freqOfNumber > 1 {
                    freq[number]! = freqOfNumber - 1
                } else {
                    freq.removeValue(forKey: number)
                }
                break
            case 3: // - 3 z : Check if any integer is present whose frequency is exactly . If yes, print 1 else 0.
                let value = freq.values.firstIndex(of: number) != nil ? 1 : 0
                print(value)
                outputArr.append(value)
                break
            default:
                break
        }
    }
    
    return outputArr
}
// Complete the countTriplets function below.
func freqQuery(queries: [[Int]]) -> [Int] {
    var freq = [Int:Int]()
    var frequencyArr = [Int]()
    var frequencyDic = [Int:Int]()
    for i in 0..<queries.count {
        let querry = queries[i][0]
        let number = queries[i][1]
        if querry == 1 {//1 x : Insert x in your data structure.
            dictionaryDecrement(dic: &frequencyDic, key: freq[number] ?? -1)
            dictionaryIncrement(dic: &freq, key: number)
            dictionaryIncrement(dic: &frequencyDic, key: freq[number]!)
        } else if querry == 2 {//2 y : Delete one occurence of y from your data structure, if present.
            dictionaryDecrement(dic: &frequencyDic, key: freq[number] ?? -1)
            dictionaryDecrement(dic: &freq, key: number)
            dictionaryIncrement(dic: &frequencyDic, key: freq[number] ?? -1)
        } else if querry == 3 {//3 z : Check if any integer is present whose frequency is exactly . If yes, print 1 else 0.
            frequencyArr.append((frequencyDic[number] ?? 0) > 0 ? 1 : 0)
        }
    }
    return frequencyArr
}
func dictionaryIncrement(dic: inout [Int:Int], key:Int) {
    if key < 0 { return }
    
    if let _ = dic[key] {
        dic[key]! += 1
    } else {
        dic[key] = 1
    }
}
func dictionaryDecrement(dic: inout [Int:Int], key:Int) {
    if key < 0 { return }
    
    if let number = dic[key] {
        if number > 1 {
            dic[key]! -= 1
        } else {
            dic.removeValue(forKey: key)
        }
    }
}
let queries  = [[1, 5],[1, 6],[3, 2],[1, 10],[1, 10],[1, 6],[2, 5],[3, 2]]
let queries1 = [[1, 3],[2, 3],[3, 2],[1, 4],[1, 5],[1, 5],[1, 4],[3, 2],[2, 4],[3, 2]]
let queries2 = [[3, 4],[2, 1003],[1, 16],[3, 1]]
calculateTime(info: "freqQuery  queries     ") { print(freqQuery(queries: queries)) }
calculateTime(info: "freqQuery  queries1    ") { print(freqQuery(queries: queries1)) }
calculateTime(info: "freqQuery  queries2    ") { print(freqQuery(queries: queries2)) }
