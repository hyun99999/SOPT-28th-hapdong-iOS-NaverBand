//
//  BandAPI.swift
//  NaverBand
//
//  Created by kimhyungyu on 2021/06/06.
//

import Foundation
import Moya

class BandAPI {
    static let shared = BandAPI()
    static let provider = MoyaProvider<BandService>()
    
    func getBands(completion: @escaping ([Band]) -> ()) {
        BandAPI.provider.request(.bands) { response in
            switch response {
            case .success(let result):
                do {
                    let results = try JSONDecoder().decode(BandlistDataModel.self, from: result.data)
                    completion(results.band)
                    print(results.message)
                } catch let err {
                    print("JSONDecode: \(err.localizedDescription)")
                    debugPrint(err)
                }
            case .failure(let err):
                print(".failure: \(err.localizedDescription)")
            }
        }
    }
    
    func getBanners(completion: @escaping (String) -> ()) {
        BandAPI.provider.request(.banners) { response in
            switch response {
            case .success(let result):
                do {
                    let results = try JSONDecoder().decode(BandBannersDataModel.self, from: result.data)
                    completion(results.bannerImg)
                    print(results.message)
                } catch let err {
                    print("JSONDecode: \(err.localizedDescription)")
                    debugPrint(err)
                }
            case .failure(let err):
                print(".failure: \(err.localizedDescription)")
            }
        }
    }
    
    func getCategories(completion: @escaping ([Category]) -> ()) {
        BandAPI.provider.request(.categories) { response in
            switch response {
            case .success(let result):
                do {
                    let results = try JSONDecoder().decode(BandCategoriesDataModel.self, from: result.data)
                    completion(results.category)
                    print(results.message)
                } catch let err {
                    print("JSONDecode: \(err.localizedDescription)")
                    debugPrint(err)
                }
            case .failure(let err):
                print(".failure: \(err.localizedDescription)")
            }
        }
    }
    func getPages(completion: @escaping ([Page]) -> ()) {
        BandAPI.provider.request(.pages) { response in
            switch response {
            case .success(let result):
                do {
                    let results = try JSONDecoder().decode(BandPagesDataModel.self, from: result.data)
                    completion(results.page)
                    print(results.message)
                } catch let err {
                    print("JSONDecode: \(err.localizedDescription)")
                    debugPrint(err)
                }
            case .failure(let err):
                print(".failure: \(err.localizedDescription)")
            }
        }
    }
    
    func getMission(completion: @escaping ([Mission]) -> ()) {
        BandAPI.provider.request(.mission) { response in
            switch response {
            case .success(let result):
                do {
                    let results = try JSONDecoder().decode(BandMissionDataModel.self, from: result.data)
                    completion(results.missions)
                } catch let err {
                    print("JSONDecode: \(err.localizedDescription)")
                    debugPrint(err)
                }
            case .failure(let err):
                print(".failure: \(err.localizedDescription)")
            }
        }
    }
}
