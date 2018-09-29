//
//  SixViewController.swift
//  CoreAnimationPractice
//
//  Created by kede on 2018/9/29.
//  Copyright © 2018 Clare320. All rights reserved.
//

import UIKit

class SixViewController: UIViewController {

    @IBOutlet weak var cyanCube: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.edgesForExtendedLayout = .init(rawValue: 88)
        
        setupMatchstickMan()
        
        setupTextLayer()
    
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let corners: UIRectCorner = [.topLeft, .topRight]
        let bezierPath = UIBezierPath(roundedRect: cyanCube.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: 10, height: 10))
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = bezierPath.cgPath
        cyanCube.layer.mask = shapeLayer
    }
    
    func setupMatchstickMan() -> Void {
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: 150, y: 10))
        path.addArc(withCenter: CGPoint(x: 150, y: 40), radius: 30, startAngle: 0, endAngle: .pi*2, clockwise: true)
        path.move(to: CGPoint(x: 150, y: 70))
        path.addLine(to: CGPoint(x: 150, y: 120))
        path.addLine(to: CGPoint(x: 120, y: 150)) // 左腿
        path.move(to: CGPoint(x: 150, y: 120))
        path.addLine(to: CGPoint(x: 180, y: 150))
        path.move(to: CGPoint(x: 120, y: 95))
        path.addLine(to: CGPoint(x: 180, y: 95))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.cyan.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 5
        shapeLayer.path = path.cgPath
        
        view.layer.addSublayer(shapeLayer)
        
    }
    
    func setupTextLayer() -> Void {
        let textLayer = CATextLayer()
        textLayer.frame = CGRect(x: 12, y: 180, width: 300, height: 50)
        view.layer.addSublayer(textLayer)

        textLayer.foregroundColor = UIColor.cyan.cgColor
        textLayer.alignmentMode = CATextLayerAlignmentMode(rawValue: "center")
        let fontName = UIFont.italicSystemFont(ofSize: 12).fontName
        textLayer.font = CGFont(fontName as CFString)
        
        textLayer.string = "This is TextLayer"
    }
    
    func setup() -> Void {
        
        let tmpView1 = UIView(frame: CGRect(x: 12, y: 250, width: 100, height: 100))
        tmpView1.backgroundColor = .black
//        view.addSubview(tmpView1)
        
//        let tmpView = UIView(frame: CGRect(x: 12, y: 250, width: 100, height: 100))
//        tmpView.backgroundColor = .cyan
//        view.addSubview(tmpView)
        
        let layer = CATransformLayer()
        layer.frame = CGRect(x: 12, y: 250, width: 100, height: 100)
        view.layer.addSublayer(layer)
        
        let tmpLayer = CALayer()
        tmpLayer.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        tmpLayer.backgroundColor = UIColor.cyan.cgColor
        layer.addSublayer(tmpLayer)
        tmpLayer.transform = CATransform3DMakeRotation(.pi/3, 1, 0, 0)
        
//        layer.transform = CATransform3DMakeRotation(.pi/4, 0, 1, 0)
        
//        let animation = CAKeyframeAnimation(keyPath: "cyan")
//        let endAngle: Double = .pi + .pi/4
//        let path = UIBezierPath(arcCenter: CGPoint(x: 112, y: 250), radius: 100, startAngle: .pi, endAngle: CGFloat(endAngle), clockwise: false)
//        animation.path = path.cgPath
//        animation.rotationMode = CAAnimationRotationMode.rotateAutoReverse
//        tmpView.layer.add(animation, forKey: "cyan")
        
        
    }

}
