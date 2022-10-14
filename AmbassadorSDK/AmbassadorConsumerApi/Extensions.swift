
import Foundation

extension String {
    
    public func toInt() -> Int? {
        if let num = NumberFormatter().number(from: self) {
            return num.intValue
        } else {
            return nil
        }
    }

}

extension Double {
    func toString() -> String {
        return String(format: "%.0f",self)
    }
    
    func toString1() -> String {
        return String(format: "%.1f",self)
    }
    
    func toString2() -> String {
        return String(format: "%.2f",self)
    }
}

protocol Convertable: Codable {

}

extension Convertable {

    /// implement convert Struct or Class to Dictionary
    func convertToDict() -> Dictionary<String, Any>? {

        var dict: Dictionary<String, Any>? = nil

        do {
            print("init student")
            let encoder = JSONEncoder()

            let data = try encoder.encode(self)
            print("struct convert to data")

            dict = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? Dictionary<String, Any>

        } catch {
            print(error)
        }

        return dict
    }
}
