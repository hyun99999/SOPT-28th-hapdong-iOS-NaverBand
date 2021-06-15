//
//  BandSearchVC.swift
//  NaverBand
//
//  Created by kimhyungyu on 2021/05/20.
//

import UIKit
import Moya

class BandSearchVC: UIViewController {
    //MARK: - Properties
    private var bandList = [Band]()
    private var missionList = [Mission]()
    private var pageList = [Page]()
    private var topicList = [Category]()
    
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
        BandAPI.shared.getBands { response in
            self.bandList = response
            self.bandCollectionView.reloadData()
        }
        BandAPI.shared.getPages { response in
            self.pageList = response
            self.pageCollectionView.reloadData()
        }
        
        BandAPI.shared.getCategories { response in
            self.topicList = response
            self.topicCollectionView.reloadData()
        }
        
        BandAPI.shared.getMission { response in
            self.missionList = response
            self.missionCollectionView.reloadData()
        }
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
            bandCell.initializeData(self.bandList[indexPath.row].img,
                                    self.bandList[indexPath.row].name,
                                    self.bandList[indexPath.row].bandDescription,
                                    "멤버 \(String(self.bandList[indexPath.row].member)) • \(self.bandList[indexPath.row].owner)",
                                    self.bandList[indexPath.row].category.name)
            return bandCell
        } else if collectionView == missionCollectionView {
            guard let missionCell = missionCollectionView.dequeueReusableCell(withReuseIdentifier: "MissionCollectionViewCell", for: indexPath) as? MissionCollectionViewCell else {
                return UICollectionViewCell()
            }
            missionCell.intializeData(missionList[indexPath.row].name,
                                      missionList[indexPath.row].period,
                                      "\(String(missionList[indexPath.row].member))명이 함께하고 있어요.",
                                      missionList[indexPath.row].img)
          
            return missionCell
        } else if collectionView == pageCollectionView {
            guard let pageCell = pageCollectionView.dequeueReusableCell(withReuseIdentifier: "PageCollectionViewCell", for: indexPath) as? PageCollectionViewCell else {
                return UICollectionViewCell()
            }
            pageCell.initializeData(self.pageList[indexPath.row].img, self.pageList[indexPath.row].name, self.pageList[indexPath.row].pageDescription, String(self.pageList[indexPath.row].member))

            return pageCell
        } else {
            guard let topicCell = topicCollectionView.dequeueReusableCell(withReuseIdentifier: "TopicCollectionViewCell", for: indexPath) as? TopicCollectionViewCell else {
                return UICollectionViewCell()
            }

            topicCell.initializeData(self.topicList[indexPath.row].name)

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
            
            topicCell.topicLabel.text = topicList[indexPath.row].name
            topicCell.topicLabel.sizeToFit()
            
            let cellWidth = topicCell.topicLabel.frame.width + 10
            return CGSize(width: cellWidth, height: 30)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 0, left: 16, bottom: 0, right: 16)
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
