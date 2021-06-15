//
//  BandPagesDataModel.swift
//  NaverBand
//
//  Created by kimhyungyu on 2021/06/06.
//

import Foundation

// MARK: - BandPagesDataModel
struct BandPagesDataModel: Codable {
    let page: [Page]
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case page, message
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        page = (try? values.decode([Page].self, forKey: .page)) ?? [Page]()
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
    }
    
}

// MARK: - Page
struct Page: Codable {
    let id, name, pageDescription, img: String
    let member: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case pageDescription = "description"
        case member
        case img
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = (try? values.decode(String.self, forKey: .id)) ?? ""
        name = (try? values.decode(String.self, forKey: .name)) ?? ""
        pageDescription = (try? values.decode(String.self, forKey: .pageDescription)) ?? ""
        member = (try? values.decode(Int.self, forKey: .member)) ?? 0
        img = (try? values.decode(String.self, forKey: .img)) ?? ""
    }
}
