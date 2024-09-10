//
//  TestViewController.swift
//  TestStackView
//
//  Created by Sergii Demets on 05.09.2024.
//

import UIKit

class MyContent:UIView, SupportsScrollableStack {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.backgroundColor = UIColor.red.cgColor
        layer.backgroundColor = UIColor.green.cgColor
    }
    
}

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let test:[MyContent] = (0...1000).map {(int)->MyContent in
            MyContent(frame: CGRect(x: 0, y: 0, width: 30, height: 50))
        }
        
        let scroll = ScrollableStackView(frame: view.frame, views: test)
        view.addSubview(scroll)
        
        //scroll.layer.borderColor = UIColor.red.cgColor
        //scroll.layer.borderWidth = 0
    }
}
