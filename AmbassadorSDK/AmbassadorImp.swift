//
//  AmbassadorImp.swift
//  AmbassadorSDK
//
//  Created by Arvind Kumar on 10/10/22.
//

import Foundation
import Alamofire

public class AmbassadorImp:AmbassBase{
    var programDomain: String
    private let PREFETCH_ZONE: String = "prefetch"
    var appName: String = ""
    
   public init(programDomain:String) {
       self.programDomain = programDomain
    }
    
    public func fetchZone(_ zoneName: String) {
       
    
    }
}
