//
//  ViewController.swift
//  CoreAnimationPractice
//
//  Created by kede on 2018/9/27.
//  Copyright © 2018 Clare320. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CALayerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        setupLayerView()
    }

    func setupLayerView() -> Void {
        let layerView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        layerView.center = view.center
        layerView.backgroundColor = .cyan
        view.addSubview(layerView)
        
        layerView.layer.contents = UIImage(named: "bpji")?.cgImage
        layerView.layer.contentsGravity = .resize
        // 不是图片放大的比例，而是像素尺寸和视图大小的比例 2代表一个点需要两个元素
//        layerView.layer.contentsScale = 3
//        layerView.layer.contentsRect = CGRect(x: 0.5, y: 0.5, width: 0.5, height: 0.5)
//        layerView.layer.contentsCenter = CGRect(x: 0.5, y: 0.5, width: 0.5, height: 0.5)
        
        
        let yellowLayer = CALayer()
        yellowLayer.frame = CGRect(x: 0, y: 44, width: view.frame.width, height: 100)
        yellowLayer.backgroundColor = UIColor.yellow.cgColor
        yellowLayer.delegate = self
        view.layer.addSublayer(yellowLayer)

        // CALayer的绘制需要显式调用
        yellowLayer.display()
        
    }
    
    
    //MARK: CALayerDelegate
    
//    func display(_ layer: CALayer) {
//        print("display")
//        // 这里可以设置contents
//    }
    
    /// display()未实现时会调用draw()方法
    func draw(_ layer: CALayer, in ctx: CGContext) {
        print("draw")
        ctx.setLineWidth(1)
        ctx.setStrokeColor(UIColor.cyan.cgColor)
        ctx.move(to: CGPoint(x: 0, y: 100))
//        ctx.addArc(tangent1End: CGPoint(x: view.frame.width/2, y: 0), tangent2End: CGPoint(x: view.frame.width - 50, y: 100), radius: 50)
        ctx.addRect(CGRect(x: 50, y: 10, width: view.frame.width - 100, height: 80))
        ctx.strokePath()
    }
}

