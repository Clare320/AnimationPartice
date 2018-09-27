//
//  ThirdViewController.swift
//  CoreAnimationPractice
//
//  Created by 李令洁 on 2018/9/27.
//  Copyright © 2018 Clare320. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupUI()
    }

    func setupUI() {
        let containerView = UIView(frame: CGRect(x: 10, y: 100, width: 200, height: 200))
        containerView.backgroundColor = .gray
        view.addSubview(containerView)
        
        let cyanLayer = CALayer()
        cyanLayer.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        cyanLayer.backgroundColor = UIColor.cyan.cgColor
        containerView.layer.addSublayer(cyanLayer)
        print("before -- \(cyanLayer.anchorPoint) position:\(cyanLayer.position)")
        
        // position: 图层在父图层坐标系中的中点位置 改变position后位置发生变化，锚点不变
        // 锚点是图层在父图层布局中的参考点，改变锚点，其实是通过处理设置的锚点跟默认锚点(0.5,0.5)差值来处理移动，图层布局跟设置锚点方向相反
        cyanLayer.anchorPoint = CGPoint(x: -0.5, y: -0.5)
//         cyanLayer.position = CGPoint(x: 110, y: 110)
        print("after -- anchorPoint:\(cyanLayer.anchorPoint)")
        print("after -- frame:\(cyanLayer.frame) position:\(cyanLayer.position)")
       
        
        
    }
    
}
