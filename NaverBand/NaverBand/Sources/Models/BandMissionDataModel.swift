//
//  BandMissionDataModel.swift
//  NaverBand
//
//  Created by kimhyungyu on 2021/06/06.
//

import Foundation

// MARK: - BandMissionDataModel
struct BandMissionDataModel: Codable {
    let missions: [Mission]
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case missions, message
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        missions = (try? values.decode([Mission].self, forKey: .missions)) ?? [Mission]()
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
    }
}

struct Mission: Codable {
    let id, name, img: String
    let member: Int
    let period: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, img, member, period
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = (try? values.decode(String.self, forKey: .id)) ?? ""
        name = (try? values.decode(String.self, forKey: .name)) ?? ""
        img = (try? values.decode(String.self, forKey: .img)) ?? ""
        member = (try? values.decode(Int.self, forKey: .member)) ?? 0
        period = (try? values.decode(String.self, forKey: .period)) ?? ""
    }
}
