import Foundation

// Enter your code here. Read input from STDIN. Print output to STDOUT
func load<T:Decodable>(_ filename:String, as type:T.Type = T.self) throws -> T {
    let data:Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else { throw StockError.invalidParameterError }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        throw StockError.invalidParameterError
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        throw StockError.invalidParameterError
    }
}

protocol StockProtocol {
    func openAndClosePrices(firstDate: String, lastDate: String, weekday: String) throws -> [Stock]
}

struct Stock: Hashable, Codable, CustomStringConvertible, LosslessStringConvertible {
    init?(_ description: String) {
        date = ""
        open = 0.0
        high = 0.0
        low = 0.0
        close = 0.0
    }
    
    var date: String
    var open: Float
    var high: Float
    var low: Float
    var close: Float
    
    public var description: String { return "\(date) \(open) \(close)" }
    
    func dateAsDate() -> Date {
        return Date(date)
    }
}

extension Date {
    init(_ dateString:String, format: String = "dd-MM-yyyy") {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = format
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
        let date = dateStringFormatter.date(from: dateString)!
        self.init(timeInterval:0, since:date)
    }
    
    var weekday: String {
        let weekdays = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
        
        let calendar = Calendar.current.component(.weekday, from: self)
        return weekdays[calendar - 1]
    }
}

class StockPrice: StockProtocol {
    let stocks: [Stock]
    
    init(stocks: [Stock]) {
        self.stocks = stocks
    }
    
    func openAndClosePrices(firstDate: String, lastDate: String, weekday: String) throws -> [Stock] {
        let range = Date(firstDate)...Date(lastDate)
        let result = stocks.filter({range.contains($0.dateAsDate()) && $0.dateAsDate().weekday.lowercased() == weekday.lowercased()})
        if result.count == 0 { throw StockError.noStockError }
        return result
    }
}

enum StockError: Error, LocalizedError {
    
    case noStockError
    case invalidParameterError
    
    var localizedDescription: String {
        switch self {
        case .noStockError: return "Stock not found."
        case .invalidParameterError: return "Invalid parameter."
        }
    }
    
    var errorDescription: String? { return localizedDescription }
}

let stdout = ""
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
guard let fileHandle = FileHandle(forWritingAtPath: stdout)
else { throw StockError.invalidParameterError }

/*
guard let firstDate = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines)
else { fatalError("Bad input") }

guard let lastDate = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines)
else { fatalError("Bad input") }

guard let weekday = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines)
else { fatalError("Bad input") } */

let firstDate = "", lastDate = "", weekday = ""

do {
    let stocks: [Stock] = try load("data.json")
    let stockPrice = StockPrice(stocks: stocks)
    let result = try stockPrice.openAndClosePrices(firstDate: firstDate, lastDate: lastDate, weekday: weekday)
    fileHandle.write(result.map{ String($0) }.joined(separator: "\n").data(using: .utf8)!)
} catch {
   fileHandle.write(String(describing: error.localizedDescription).data(using: .utf8)!)
}
