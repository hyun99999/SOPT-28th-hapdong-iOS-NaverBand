//
//  BandCategoriesDatModel.swift
//  NaverBand
//
//  Created by kimhyungyu on 2021/06/06.
//

import Foundation

// MARK: - BandCategoriesDataModel
struct BandCategoriesDataModel: Codable {
    let category: [Category]
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case category, message
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        category = (try? values.decode([Category].self, forKey: .category)) ?? [Category]()
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
    }
}

// MARK: - Category
//struct Category: Codable {
//    let id, name: String
//
//    enum CodingKeys: String, CodingKey {
//        case id = "_id"
//        case name
//    }
//}
