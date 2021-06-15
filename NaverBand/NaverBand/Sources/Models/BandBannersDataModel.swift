//
//  BandBannersDataModel.swift
//  NaverBand
//
//  Created by kimhyungyu on 2021/06/06.
//

import Foundation

// MARK: - BandBannersDataModel
struct BandBannersDataModel: Codable {
    let bannerImg: String
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case bannerImg, message
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        bannerImg = (try? values.decode(String.self, forKey: .bannerImg)) ?? ""
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
    }
}
