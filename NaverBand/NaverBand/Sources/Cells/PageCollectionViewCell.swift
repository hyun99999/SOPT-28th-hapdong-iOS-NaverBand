//
//  PageCollectionViewCell.swift
//  NaverBand
//
//  Created by 이정엽 on 2021/05/17.
//

import UIKit

class PageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var pageImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var detailLabel: UILabel!
    
    @IBOutlet weak var subscriberLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.pageImageView.layer.cornerRadius = self.pageImageView.frame.height / 2
        // Initialization code
    }
    
    func initializeData(_ image: String, _ name: String, _ detail: String, _ subscribe: String) {
        if let url = URL(string: image){
            pageImageView.kf.setImage(with: url)
        }
        pageImageView.contentMode = .scaleAspectFill
        self.nameLabel.text = name
        self.detailLabel.text = detail
        self.subscriberLabel.text = subscribe+"명 구독 중"
    }

}
