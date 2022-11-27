//
//  ViewController.swift
//  ThumbsUpButton
//
//  Created by kim on 2022/11/26.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tumblrButton = TumblrButton(frame: CGRectMake(200, 200, 30, 30))
        self.view.addSubview(tumblrButton)
        
        //添加点赞按钮
        let qqButton = QQLikeButton(type: UIButton.ButtonType.custom)
        qqButton.frame = CGRect(x: 200, y: 400, width: 30, height: 130)
        view.addSubview(qqButton)
    }
    
    



}

