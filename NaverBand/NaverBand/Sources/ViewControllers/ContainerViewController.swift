//
//  ContainerViewController.swift
//  NaverBand
//
//  Created by 이정엽 on 2021/05/21.
//

import UIKit

class ContainerViewController: UIViewController {

    @IBOutlet weak var ContainerView: UIView!
    
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        transitionToHome()
  

        // Do any additional setup after loading the view.
    }
    

    @IBAction func touchSearchButton(_ sender: Any) {
        if homeButton.isSelected == false {
            removeChildView()
            transitionToSearch()
        }
        
    }
    @IBAction func touchHomeButton(_ sender: Any) {
        if searchButton.isSelected == false {
            removeChildView()
            transitionToHome()
            
        }
    }
    
    private func transitionToHome() {
        self.homeButton.setImage(UIImage(named: "icHomeActivated"), for: .normal)
        self.searchButton.setImage(UIImage(named: "icSearch"), for: .normal)
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        
        guard let vc = storyboard.instantiateViewController(identifier: "HomeViewController") as? HomeViewController else {
            return
        }
        
        self.addChild(vc)
        vc.view.frame = self.ContainerView.bounds
        self.ContainerView.addSubview(vc.view)
    }
    
    private func transitionToSearch() {
        self.homeButton.setImage(UIImage(named: "icHomeInactivated"), for: .normal)
        self.searchButton.setImage(UIImage(named: "icSearchActivated"), for: .normal)
        let storyboard = UIStoryboard(name: "BandSearch", bundle: nil)
        
        guard let vc = storyboard.instantiateViewController(identifier: "BandSearchVC") as? BandSearchVC else {
            return
        }
        
        self.addChild(vc)
        vc.view.frame = self.ContainerView.bounds
        self.ContainerView.addSubview(vc.view)
    }
    
    private func removeChildView() {
        for vc in children {
            vc.view.removeFromSuperview()
            vc.removeFromParent()
            
        }
    }
}
