//
//  MainMoreCollectionViewCell.swift
//  NaverBand
//
//  Created by 이정엽 on 2021/05/17.
//

import UIKit

class MainMoreCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var numLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func initializeData(_ num: String, _ title: String) {
        numLabel.text = num
        titleLabel.text = title
    }

}
