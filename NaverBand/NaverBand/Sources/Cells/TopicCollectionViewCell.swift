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
    
    func initializeData(_ topic: String?) {
        if let text = topic {
            topicLabel.text = text
        }
        topicBackgroundView.layer.cornerRadius = 10
    }

}
