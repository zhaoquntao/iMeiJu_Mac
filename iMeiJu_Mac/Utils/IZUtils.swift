////  IZUtils.swift
//  iMeiJu_Mac
//
//  Created by iizvv on 2019/2/3.
//	QQ群:	577506623
//	GitHub:	https://github.com/iizvv
//  Copyright © 2019 iizvv. All rights reserved.
//

import Foundation
import Moya

enum MoyaApi {
    case index(vsize: String)
}

extension MoyaApi : TargetType {

    var baseURL: URL {
        return URL.init(string: "https://mjappaz.yefu365.com")!
    }
    
    var path: String {
        switch self {
        case .index:
            return "/index.php/app/ios/topic/index"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .index:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data(base64Encoded: "just for test")!
    }
    
    var task: Task {
        switch self {
        case let .index(vsize):
            return .requestParameters(parameters:["vsize":vsize], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type" : "application/json"]
    }
    
    
}