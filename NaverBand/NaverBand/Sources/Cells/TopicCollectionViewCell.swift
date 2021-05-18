//
//  TopicCollectionViewCell.swift
//  NaverBand
//
//  Created by 이정엽 on 2021/05/19.
//

import UIKit

class TopicCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var topicLabel: UILabel!
    @IBOutlet weak var topicBackgroundView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func initializeData(_ topic: String) {
        topicLabel.text = topic
        topicBackgroundView.layer.cornerRadius = 10
    }

}
