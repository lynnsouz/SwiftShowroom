import UIKit


struct Queue<T> {
    private var elements: [T] = []
    
    mutating func enqueue(_ value: T) {
        elements.append(value)
    }
    
    mutating func dequeue() -> T? {
        guard !elements.isEmpty else {
            return nil
        }
        return elements.removeFirst()
    }
    
    mutating func front() -> T? {
        guard !elements.isEmpty else {
            return nil
        }
        return elements.first
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var size: Int {
        return elements.count
    }
}

func getTimes(time: [Int], direction: [Int]) -> [Int] {
    // Write your code here
    var result = [Int](repeating: 0, count: time.count)
    var used: Bool = false
    var out: Bool = false
    var timer = 0
    var i = 0
    var iq = Queue<Int>()
    var oq = Queue<Int>()
    
    while i < time.count || !iq.isEmpty || !oq.isEmpty {
        
        while i < time.count && timer == time[i] {
            direction[i] == 0 ? iq.enqueue(i) : oq.enqueue(i)
            i+=1
        }
        if !iq.isEmpty || !oq.isEmpty {
            if !used {
                if !oq.isEmpty {
                    result[oq.dequeue()!] = timer
                    out = true
                } else {
                    result[iq.dequeue()!] = timer
                    out = false
                }
                used = true
            } else {
                if out && !oq.isEmpty {
                    result[oq.dequeue()!] = timer
                    out = true
                } else if !iq.isEmpty {
                    result[iq.dequeue()!] = timer
                    out = true
                } else {
                    out = false
                }
            }
        } else {
            used = false
        }
        timer+=1
    }
    
    return result
}

func getTimes2(time: [Int], direction: [Int]) -> [Int] {
    var result = [Int](repeating: -1, count: time.count)
    
    let endTime = time.max() ?? 0
    
    
    var inq = Queue<Int>()
    var outq = Queue<Int>()
    
    var currentIndex = 0
    var turnstile = 0
    
    for t in 0...endTime {
        while time[currentIndex] == t {
            if direction[currentIndex] == 0 {
                inq.enqueue(currentIndex)
            } else if direction[currentIndex] == 1 {
                outq.enqueue(currentIndex)
            }
            currentIndex+=1
            if currentIndex == time.count { break }
        }
        
        if (inq.size + outq.size) == 0 { turnstile = 0 }
        
        if turnstile == 1 || outq.isEmpty {
            if !inq.isEmpty {
                let next = inq.dequeue()!
                result[next] = t
                turnstile = 1
            } else if !outq.isEmpty {
                let next = outq.dequeue()!
                result[next] = t
                turnstile = 2
                
            }
        } else if !outq.isEmpty {
            let next = outq.dequeue()!
            result[next] = t
            turnstile = 2
        }
    }
    
    if !inq.isEmpty {
        var newEndTime = endTime
        while !inq.isEmpty {
            result[inq.dequeue()!] = newEndTime + 1
            newEndTime+=1
        }
    }
    
    return result
}

func getTimes3(time: [Int], direction: [Int]) -> [Int] {
    var exit = Queue<(Int, Int)>()
    var entry = Queue<(Int, Int)>()
    let n = time.count
    var res = [Int](repeating: -1, count: time.count)
    
    for i in 0..<n {
        direction[i] == 1 ? exit.enqueue((time[i],i)) : entry.enqueue((time[i],i))
    }
    var ct = 0
    var lc = -1
    
    while !exit.isEmpty || !entry.isEmpty {
        if(!exit.isEmpty &&
            (exit.front() ?? (-1,-1)).0 <= ct &&
            (lc == 1 || lc == -1 ||
            entry.isEmpty || (entry.front() ?? (-1,-1)).0 > ct && lc == 0) ) {
            res[exit.dequeue()!.1] = ct;
            lc = 1;
        } else if !entry.isEmpty && (entry.front() ?? (-1,-1)).0 <= ct {
            res[entry.dequeue()!.1] = ct
            lc = 0
        } else {
            lc = -1
        }
        ct+=1
    }
    return res
}

getTimes3(time: [0, 0, 1, 5], direction: [0, 1, 1, 0]) //[2, 0, 1, 5]
getTimes3(time: [0,1,1,3,3], direction: [0,1,0,0,1]) // [0, 2, 1, 4, 3]


