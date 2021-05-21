//
//  MainCollectionViewCell.swift
//  NaverBand
//
//  Created by 이정엽 on 2021/05/17.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var squareButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // 메인 콜렉션 뷰에서 셀을 재활용하기 위해서 isHiddenSquare 매개변수 받음
    // true로 설정하면 위에 있는 컬렉션 뷰 셀
    // false로 설정하면 밑에 있는 컬렉션 뷰 셀
    func initializeData(image: String, title: String,isHiddenSquare: Bool) {
        self.cellImageView.image = UIImage(named: image)
        self.titleLabel.text = title
        self.squareButton.isHidden = isHiddenSquare
    }

}
