//
//  MemeDetailViewController.swift
//  MemeMe 1.0
//
//  Created by Shehana Aljaloud on 18/05/2019.
//  Copyright © 2019 Shehana Aljaloud. All rights reserved.
//

import Foundation
import UIKit

class MemeDetailViewController: UIViewController {
    
    var memeToShow: Meme!
    
    @IBOutlet var imageView: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        imageView.image = memeToShow.memeImage
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
}
