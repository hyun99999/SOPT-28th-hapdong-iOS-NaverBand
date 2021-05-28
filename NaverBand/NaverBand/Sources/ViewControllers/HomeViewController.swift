//
//  HomeViewController.swift
//  NaverBand
//
//  Created by 이은영 on 2021/05/20.
//
import UIKit
                                           
class HomeViewController: UIViewController {

    @IBOutlet weak var MainCollectionView: UICollectionView!
    
    private var MainList : [MainDataModel] = []
    private var MainList2 : [MainDataModel] = []
    private var MainList3 : [MainMoreDataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setMainList()
        MainCollectionView.delegate=self
        MainCollectionView.dataSource=self
        // Do any additional setup after loading the view.
        let nibName = UINib(nibName: "MainCollectionViewCell", bundle: nil)
        MainCollectionView.register(nibName, forCellWithReuseIdentifier:"MainCollectionViewCell" )

        let nibName2 = UINib(nibName: "MainMoreCollectionViewCell", bundle: nil)
        MainCollectionView.register(nibName2, forCellWithReuseIdentifier:"MainMoreCollectionViewCell" )
    }
    

   func setMainList()
    {
        MainList.append(contentsOf: [
         MainDataModel(coverName: "mainImg1", title: "가족여행",isHiddenSquare: true),
         MainDataModel(coverName: "mainImg2", title: "광희초 3-8",isHiddenSquare: true),
         MainDataModel(coverName: "mainImg3", title: "캠핑카 대여소",isHiddenSquare: true),
         MainDataModel(coverName: "mainImg4", title: "귀여운 강아지",isHiddenSquare: true),
         MainDataModel(coverName: "mainImg5" , title: "킹왕짱 댄스팀",isHiddenSquare: true),
         MainDataModel(coverName: "mainImg6", title: "광희중 4-5",isHiddenSquare: true),
         MainDataModel(coverName: "mainImg7", title: "추니 여행",isHiddenSquare: true),
         MainDataModel(coverName: "mainImg8", title: "내일로 여행",isHiddenSquare: true)
        ])
        MainList2.append(contentsOf: [
            MainDataModel(coverName: "mainImg9", title: "바람잘날 없는 글잡이",isHiddenSquare: false),
            MainDataModel(coverName: "mainImg10", title: "청량 얼반",isHiddenSquare: false),
            MainDataModel(coverName: "mainImg11", title: "예쁜 옷 도매물",isHiddenSquare: false),
            MainDataModel(coverName: "mainImg12", title: "제주도 한달 살이",isHiddenSquare: false)
        ])
        MainList3.append(contentsOf: [MainMoreDataModel(label: "19개 밴드", title: "방문 뜸한 밴드 더보기")])
    }

}

extension HomeViewController : UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(section==0){
            return MainList.count + MainList3.count
        }else{
            return MainList2.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
        if(indexPath.section==0 && indexPath.row < 8){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as! MainCollectionViewCell
            cell.initializeData(image: MainList[indexPath.row].coverName, title: MainList[indexPath.row].title, isHiddenSquare: true)
            return cell
        }
        else if(indexPath.section==0 && indexPath.row == 8){
            let cell3 = collectionView.dequeueReusableCell(withReuseIdentifier: "MainMoreCollectionViewCell", for: indexPath) as! MainMoreCollectionViewCell
            cell3.initializeData(num: MainList3[indexPath.row - 8].label, title: MainList3[indexPath.row - 8].title)
            return cell3
            
        }
        else{
            let cell2=collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as! MainCollectionViewCell
            cell2.initializeData(image: MainList2[indexPath.row].coverName, title: MainList2[indexPath.row].title, isHiddenSquare: false)
            
            return cell2
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        var header : CollectionViewHeader?
        
        if kind == UICollectionView.elementKindSectionHeader{
            header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "reusableView", for: indexPath) as? CollectionViewHeader

            if(indexPath.section==0){
                header?.header_image.image=UIImage(named: "btnPlusBand")
                header?.header_label.text="목록관리"
            }else{
                header?.header_image.image=UIImage(named: "btnPlusPage" )
                header?.header_label.text=""
            }
        }
        return header!

    }
}

extension HomeViewController : UICollectionViewDelegate{

    
}

extension HomeViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 22
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = UIScreen.main.bounds.width
        
        let cellWidth = width * (106/375)
        let cellHeight = cellWidth * (98/106)
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
}
