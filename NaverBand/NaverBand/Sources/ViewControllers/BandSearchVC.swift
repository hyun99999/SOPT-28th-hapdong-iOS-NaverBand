//
//  BandSearchVC.swift
//  NaverBand
//
//  Created by kimhyungyu on 2021/05/19.
//

import UIKit

class BandSearchVC: UIViewController {
    
    //MARK: - Properties
    
    private var hashtagList = [String]()
    
    //MARK: - @IBOutlet Properties
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondeLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var fourthLabel: UILabel!
    @IBOutlet weak var hashtagCollectionView: UICollectionView!
    @IBOutlet weak var recommendCollectionView: UICollectionView!
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setHashtagList()
        print(hashtagList)
        
        hashtagCollectionView.delegate = self
        hashtagCollectionView.dataSource = self
        hashtagCollectionView.register(<#T##cellClass: AnyClass?##AnyClass?#>, forCellWithReuseIdentifier: <#T##String#>)
        
        recommendCollectionView.delegate = self
        recommendCollectionView.dataSource = self
    }
    
    //MARK: - @objc Methods
}

//MARK: - Extensions
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
    
    private func setHashtagList() {
        self.hashtagList = ["btnCulture","btnEducation","btnFarm","btnIt","btnPet","btnLifeinfo","btnBroadcast","btnFood","btnLanguage","btnTravel","btnScience", "btnAge"]
    }
}

//MARK: -
extension BandSearchVC: UICollectionViewDelegate {
    
}

extension BandSearchVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("numberOfItemsInSection")
        return hashtagList.count
         
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HashtagCollectionViewCell.identifier, for: indexPath) as? HashtagCollectionViewCell else {
            print("else")
            return UICollectionViewCell()
        }
        cell.setImageView(image: hashtagList[indexPath.row])
//        cell.setImageView(image: "circle.fill")
        print("cellForItemAt")
        return cell
    }
}

extension BandSearchVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let cellWidth = UIImage(named: hashtagList[indexPath.row])
//        let cellHeight =
        print("sizeForItemAt")
        return CGSize(width: 100, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        print("UIEdgeInsets")
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        print("14")
        return 14
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        print("12")
        return 12
    }
}
