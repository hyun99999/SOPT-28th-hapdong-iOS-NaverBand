//
//  BandCollectionViewCell.swift
//  NaverBand
//
//  Created by 이정엽 on 2021/05/17.
//

import UIKit

class BandCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var bandImageView: UIImageView!
    
    // 회색 글씨 라벨 = info
    @IBOutlet weak var infoLabel: UILabel!
    
    // 밴드 정보 라벨 2줄 제한 뒀음
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // 제목 라벨
    @IBOutlet weak var titleLabel: UILabel!
    
    // 카테고리 정보를 담는 라벨
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var categoryView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryView.layer.cornerRadius = self.categoryView.frame.height;
        // Initialization code
    }
    
    func initializeData(_ image: String, _ title: String, _ description: String, _ info: String, _ category: String) {
        if let image = UIImage(named: image) {
            self.bandImageView.image = image
        }
//        self.bandImageView.image = UIImage(named: image)
        self.titleLabel.text = title
        self.descriptionLabel.text = description
        self.infoLabel.text = info
        self.categoryLabel.text = category
    }

}
