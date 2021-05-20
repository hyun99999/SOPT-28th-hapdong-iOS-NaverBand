//
//  BandSearchVC.swift
//  NaverBand
//
//  Created by kimhyungyu on 2021/05/20.
//

import UIKit

class BandSearchVC: UIViewController {
    //MARK: - Properties
    private var bandList = [String]()
    private var missionList = [String]()
    private var pageList = [String]()
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
        
        setTopicList()
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
        bandCollectionView.register(BandCollectionViewCell.self, forCellWithReuseIdentifier: "BandCollectionViewCell")
        
        missionCollectionView.delegate = self
        missionCollectionView.dataSource = self
        missionCollectionView.register(MissionCollectionViewCell.self, forCellWithReuseIdentifier: "MissionCollectionViewCell")
        
        pageCollectionView.delegate = self
        pageCollectionView.dataSource = self
        pageCollectionView.register(PageCollectionViewCell.self, forCellWithReuseIdentifier: "PageCollectionViewCell")
        
        topicCollectionView.delegate = self
        topicCollectionView.dataSource = self
        topicCollectionView.register(TopicCollectionViewCell.self, forCellWithReuseIdentifier: "TopicCollectionViewCell")
    }
    
    private func setTopicList() {
        self.topicList = ["문화/예술","교육/공부","자연/귀농","IT/컴퓨터","반려동물/동물","생활정보/인테리어","방송/연예","맛집/요리","어학/외국어","여행/캠핑","인문/과학", "나이/또래모임"]
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
            return UICollectionViewCell()
        } else if collectionView == missionCollectionView {
            return UICollectionViewCell()
        } else if collectionView == pageCollectionView {
            return UICollectionViewCell()
        } else {
            print("topic")
            guard let topicCell = topicCollectionView.dequeueReusableCell(withReuseIdentifier: "TopicCollectionViewCell", for: indexPath) as? TopicCollectionViewCell else {
                return UICollectionViewCell()
            }
            print(topicList)
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
            return CGSize(width: 320, height: 80)
        } else {
            
            return CGSize(width: 200, height: 40)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == bandCollectionView {
            return 46
        } else if collectionView == missionCollectionView {
            return 0
        } else if collectionView == pageCollectionView {
            return 21
        } else {
            return 14
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == bandCollectionView {
            return 0
        } else if collectionView == missionCollectionView {
            return 9
        } else if collectionView == pageCollectionView {
            return 9
        } else {
            return 12
        }
    }
}
