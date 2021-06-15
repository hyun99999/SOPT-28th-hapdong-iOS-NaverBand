//
//  BandlistDataModel.swift
//  NaverBand
//
//  Created by kimhyungyu on 2021/06/06.
//

// MARK: - BandlistDataModel
struct BandlistDataModel: Codable {
    let band: [Band]
    let message: String
}

// MARK: - Band
struct Band: Codable {
    let id: String
    let category: Category
    let bandDescription: String
    let img: String
    let member: Int
    let name, owner: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case category
        case bandDescription = "description"
        case img, member, name, owner
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = (try? values.decode(String.self, forKey: .id)) ?? ""
        category = (try? values.decode(Category.self, forKey: .category)) ?? Category(id: "", name: "")
        bandDescription = (try? values.decode(String.self, forKey: .bandDescription)) ?? ""
        img = (try? values.decode(String.self, forKey: .img)) ?? ""
        member = (try? values.decode(Int.self, forKey: .member)) ?? 0
        name = (try? values.decode(String.self, forKey: .name)) ?? ""
        owner = (try? values.decode(String.self, forKey: .owner)) ?? ""
    }
}

// MARK: - Category
struct Category: Codable {
    let id, name: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
    }
}
