
import Foundation
import Alamofire

class APIManger{
    static let shard = APIManger()
    private init() {}
    
    func postServiceRequest(url:String, request:[String:Any]?,complete: @escaping ([String:Any]?,Error?)->()){
        AF.request(url, method: .post, parameters: request, encoding: JSONEncoding.default, headers: nil).validate(statusCode: 200 ..< 299).responseData { response in
            switch response.result {
                case .success(let data):
                do {
                    if let results = try JSONSerialization.jsonObject(with: data) as? [String:Any] {
                        complete(results, nil)
                    } else {
                        print("JSON was not the expected array of dictonary")
                    }
                } catch {
                    print("Can't process JSON: \(error)")
                    complete(nil, error)
                }
                
                case .failure(let error):
                    print(error)
                complete(nil, error)
            }
        }
    }
    
    func getServiceRequest(url:String, request:[String:Any]?,complete: @escaping ([String:Any]?,Error?)->()){
        AF.request(url, parameters: request, headers: nil).validate(statusCode: 200 ..< 299).responseData { response in
            switch response.result {
            case .success(let data):
            do {
                if let results = try JSONSerialization.jsonObject(with: data) as? [String:Any] {
                    complete(results, nil)
                } else {
                    print("JSON was not the expected array of dictonary")
                }
            } catch {
                print("Can't process JSON: \(error)")
                complete(nil, error)
            }
            
            case .failure(let error):
                print(error)
            complete(nil, error)
        }
        }
    }
    
}


