//
//  TempAPIService.swift
//  NaverBand
//
//  Created by 이정엽 on 2021/05/16.
//

import Foundation
import Moya

public enum BandService {
    case bands
    case banners
    case categories
    case pages
    case mission
}

extension BandService: TargetType {
    public var baseURL: URL {
        return URL(string: GeneralAPI.baseURL)!
    }
    
    public var path: String {
        switch self {
        case .bands:
            return "/api/bands"
        case .banners:
            return "/api/banners"
        case .categories:
            return "api/categories"
        case .pages:
            return "/api/pages"
        case .mission:
            return "/api/mission"
        }
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var sampleData: Data {
        return  "sampleData".data(using: .utf8)!
    }
    
    public var task: Task {
        .requestPlain
    }
    
    public var headers: [String : String]? {
        switch self {
        default:
            return ["Content-Type": "application/json"]
        }
    }
    
    
}
