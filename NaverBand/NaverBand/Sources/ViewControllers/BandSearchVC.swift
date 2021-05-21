//
//  BandSearchVC.swift
//  NaverBand
//
//  Created by kimhyungyu on 2021/05/20.
//

import UIKit

class BandSearchVC: UIViewController {
    //MARK: - Properties
    private var bandList = [BandDataModel]()
    private var missionList = [MissionDataModel]()
    private var pageList = [PageDataModel]()
    private var topicList = [String]()
    
    //MARK: - @IBOutlet Properties
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondeLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var fourthLabel: UILabel!

    
    @IBOutlet weak var bandCollectionView: UICollectionView!
    @IBOutlet weak var missionCollectionView: UICollectionView!
    @IBOutlet weak var pageCollectionView: UICollectionView!
    @IBOutlet weak var topicCollectionView: UICollectionView!
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setList()
        setCollectionView()
        setUI()
    }
}

extension BandSearchVC {
    private func setUI() {
        firstLabel.text = "이런 밴드는 어때요?"
        firstLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        secondeLabel.text = "미션인증 도전해요!"
        secondeLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        thirdLabel.text = "추천 페이지"
        thirdLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        fourthLabel.text = "주제별로 모임을 찾아볼까요?"
        fourthLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
    }
    
    private func setCollectionView() {
        bandCollectionView.delegate = self
        bandCollectionView.dataSource = self
        let bandCell = UINib(nibName: "BandCollectionViewCell", bundle: nil)
        bandCollectionView.register(bandCell, forCellWithReuseIdentifier: "BandCollectionViewCell")
        
        missionCollectionView.delegate = self
        missionCollectionView.dataSource = self
        let missionCell = UINib(nibName: "MissionCollectionViewCell", bundle: nil)
        missionCollectionView.register(missionCell, forCellWithReuseIdentifier: "MissionCollectionViewCell")
        
        pageCollectionView.delegate = self
        pageCollectionView.dataSource = self
        let pageCell = UINib(nibName: "PageCollectionViewCell", bundle: nil)
        pageCollectionView.register(pageCell, forCellWithReuseIdentifier: "PageCollectionViewCell")
        
        topicCollectionView.delegate = self
        topicCollectionView.dataSource = self
        let topicCell = UINib(nibName: "TopicCollectionViewCell", bundle: nil)
        topicCollectionView.register(topicCell ,forCellWithReuseIdentifier: "TopicCollectionViewCell")
    
    }
    
    private func setList() {
        self.pageList.append(contentsOf: [
            PageDataModel(pageImage: "img1",
                          title: "몽그림",
                          detail: "그림연습",
                          subscribe: "27"),
            PageDataModel(pageImage: "img2",
                          title: "맛집찾아 삼만리",
                          detail: "국내맛집, 해외맛집, 우주맛집 찾아가는 날까지... 맛집 기행은 계속 됩니다....",
                          subscribe: "3902"),
            PageDataModel(pageImage: "img3",
                          title: "혼밥레시피",
                          detail: "혼자 밥잘해먹는 기술입니다.요리도 기술이고 응용이고 예술이고 종합인 시대에 혼밥인생...",
                          subscribe: "124"),
            PageDataModel(pageImage: "img1",
                          title: "몽그림",
                          detail: "그림연습",
                          subscribe: "27"),
            PageDataModel(pageImage: "img2",
                          title: "맛집찾아 삼만리",
                          detail: "국내맛집, 해외맛집, 우주맛집 찾아가는 날까지... 맛집 기행은 계속 됩니다....",
                          subscribe: "3902"),
            PageDataModel(pageImage: "img3",
                          title: "혼밥레시피",
                          detail: "혼자 밥잘해먹는 기술입니다.요리도 기술이고 응용이고 예술이고 종합인 시대에 혼밥인생...",
                          subscribe: "124")
        ])
        self.topicList = ["문화/예술","교육/공부","자연/귀농","IT/컴퓨터","반려동물/동물","생활정보/인테리어","방송/연예","맛집/요리","어학/외국어","여행/캠핑","인문/과학", "나이/또래모임"]
        
        self.missionList.append(contentsOf: [
            MissionDataModel(term: "매일 ⋅ 31일간", missionTitle: "하루 한줄 매일 그림", status: "56명이 함께하고 있어요."),
            MissionDataModel(term: "매일 ⋅ 31일간", missionTitle: "하루 한줄 매일 그림", status: "56명이 함께하고 있어요.")
        ])
        
        self.bandList.append(contentsOf: [
        BandDataModel(image: "imgDog", title: "리트리버", description: "리트리버 동호회", info: "멤버 1,024 • 레오(남) 14년 11월 서울", category: "반려동물"),
        BandDataModel(image: "imgGallery", title: "아트 뮤지엄 갤러리 Tour", description: "새롭고, 다른, 살아있는 미술이야기화가의 진정한 모습과 눈에 보이는 미술관을 말하는 미", info: "멤버 902 • ReeMoon 이필준", category: "미술관")
        ])
    }
    
}

//MARK: - UICollection protocol
extension BandSearchVC: UICollectionViewDelegate {
    
}

extension BandSearchVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == bandCollectionView {
            return bandList.count
            
        } else if collectionView == missionCollectionView {
            return missionList.count
        } else if collectionView == pageCollectionView {
            return pageList.count
        } else {
            return topicList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == bandCollectionView {
            guard let bandCell = bandCollectionView.dequeueReusableCell(withReuseIdentifier: "BandCollectionViewCell", for: indexPath) as? BandCollectionViewCell else {
                return UICollectionViewCell()
            }
            bandCell.initializeData(bandList[indexPath.item].image,
                                    bandList[indexPath.item].title,
                                    bandList[indexPath.item].description,
                                    bandList[indexPath.item].info,
                                    bandList[indexPath.item].category)
            return bandCell
        } else if collectionView == missionCollectionView {
            guard let missionCell = missionCollectionView.dequeueReusableCell(withReuseIdentifier: "MissionCollectionViewCell", for: indexPath) as? MissionCollectionViewCell else {
                return UICollectionViewCell()
            }
            missionCell.intializeData(missionList[indexPath.item].missionTitle,
                                      missionList[indexPath.item].term,
                                      missionList[indexPath.item].status)
          
            return missionCell
        } else if collectionView == pageCollectionView {
            guard let pageCell = pageCollectionView.dequeueReusableCell(withReuseIdentifier: "PageCollectionViewCell", for: indexPath) as? PageCollectionViewCell else {
                return UICollectionViewCell()
            }
            pageCell.initializeData(pageList[indexPath.row].pageImage, pageList[indexPath.row].title, pageList[indexPath.row].detail, pageList[indexPath.row].subscribe)
            
            return pageCell
        } else {
            guard let topicCell = topicCollectionView.dequeueReusableCell(withReuseIdentifier: "TopicCollectionViewCell", for: indexPath) as? TopicCollectionViewCell else {
                return UICollectionViewCell()
            }
            topicCell.initializeData(topicList[indexPath.row])
            
            return topicCell
        }
    }
}

extension BandSearchVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == bandCollectionView {
            return CGSize(width: 320, height: 100)
        } else if collectionView == missionCollectionView {
            return CGSize(width: 241, height: 202)
        } else if collectionView == pageCollectionView {
            return CGSize(width: 320, height: 90)
        } else {
            guard let topicCell = topicCollectionView.dequeueReusableCell(withReuseIdentifier: "TopicCollectionViewCell", for: indexPath) as? TopicCollectionViewCell else {
                return CGSize(width: 0, height: 0)
            }
            topicCell.topicLabel.text = topicList[indexPath.row]
            topicCell.topicLabel.sizeToFit()
            
            let cellWidth = topicCell.topicLabel.frame.width + 10
            return CGSize(width: cellWidth, height: 30)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == bandCollectionView {
            return 46
        } else if collectionView == missionCollectionView {
            return 9
        } else if collectionView == pageCollectionView {
            return 9
        } else {
            return 14
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == bandCollectionView {
            return 0
        } else if collectionView == missionCollectionView {
            return 0
        } else if collectionView == pageCollectionView {
            return 21
        } else {
            return 12
        }
    }
}
