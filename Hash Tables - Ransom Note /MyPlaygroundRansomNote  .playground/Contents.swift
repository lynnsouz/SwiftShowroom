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
func checkMagazine(magazine: [String], note: [String]) -> Void {
    var words = [String:Int]()
    for word in magazine {
        words[word] = (words[word] ?? 0) + 1
    }
    for word in note {
        if let x = words[word], x > 0 {
            words[word]! -= 1
        } else { print("No"); return; }
    }
    print("Yes")
}

let magazine = "give me one grand today night".components(separatedBy: .whitespaces)
let note = "give one grand today".components(separatedBy: .whitespaces)

let magazineNo = "ive got a lovely bunch of coconuts".components(separatedBy: .whitespaces)
let noteNo = "ive got some coconuts".components(separatedBy: .whitespaces)

calculateTime(info: "checkMagazine  magazine    ") { checkMagazine(magazine: magazine,      note: note  )}
calculateTime(info: "checkMagazine  magazineNo  ") { checkMagazine(magazine: magazineNo,    note: noteNo)}
