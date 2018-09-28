//
//  FourViewController.swift
//  CoreAnimationPractice
//
//  Created by kede on 2018/9/28.
//  Copyright © 2018 Clare320. All rights reserved.
//

import UIKit

class FourViewController: UIViewController {
    @IBOutlet weak var leftTopWhiteView: UIView!
    
    @IBOutlet weak var rightTopAlphaView: UIView!
    @IBOutlet weak var alphaInnerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        configureUI()
    }
    
    
    func configureUI() {
        let giftLayer = CALayer()
        giftLayer.bounds = leftTopWhiteView.bounds
        giftLayer.contents = UIImage(named: "icon_invite_gift")?.cgImage
        
        leftTopWhiteView.layer.mask = giftLayer
        
        rightTopAlphaView.alpha = 0.5
//        alphaInnerLabel.alpha = 0.5
        //TODO:没感受到变化--
        rightTopAlphaView.layer.rasterizationScale = UIScreen.main.scale
        rightTopAlphaView.layer.shouldRasterize = true
    }


}

///
/*
  cornerRadius,borderColor,borderWidth都是依赖于layer的边界，并不作用于图层的内容
 */
