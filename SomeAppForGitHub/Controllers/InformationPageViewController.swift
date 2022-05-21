//
//  InformationPageViewController.swift
//  SomeAppForGitHub
//
//  Created by user on 16/5/22.
//

import UIKit

class InformationPageViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var subtitleLabel: UILabel!
    
    @IBOutlet weak var postImage: UIImageView!
    
    var titleOfPage = ""
    var subtitleOfPage = ""
    var imageOfPage = UIImageView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = titleOfPage
        subtitleLabel.text = subtitleOfPage
        postImage.image = imageOfPage.image
    }

}
