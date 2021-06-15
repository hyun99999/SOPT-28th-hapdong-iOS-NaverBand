//
//  MissionCollectionViewCell.swift
//  NaverBand
//
//  Created by 이정엽 on 2021/05/19.
//

import UIKit

class MissionCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var superView: UIView!
    // term은 초록색 바탕에 잇는 글씨
    @IBOutlet weak var termButton: UIButton!
    
    @IBOutlet weak var missionImageView: UIImageView!
    
    // 이미지 뷰 위에 있는 라벨
    @IBOutlet weak var missionTitleLabel: UILabel!
    // 몇 명 지워했는지에 대한 라벨
    @IBOutlet weak var statusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
   
        // Initialization code
    }

    func intializeData(_ missionTitle: String, _ term: String, _ status: String, _ image: String) {
        if let url = URL(string: image) {
            missionImageView.kf.setImage(with: url)
        }
        missionImageView.contentMode = .scaleAspectFill
        self.missionTitleLabel.text = missionTitle
        self.termButton.setTitle(term, for: .normal)
        self.statusLabel.text = status
       
        self.superView.layer.cornerRadius = 15
        self.termButton.layer.cornerRadius = 7
        self.termButton.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMaxYCorner)
    }
}
