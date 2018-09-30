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
    
        setupTransformLayer()
        
        setupGradientLayer()
        
        setupReplicatorLayer()
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
    
    func setupTransformLayer() -> Void {
        
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

    func setupGradientLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 12, y: 370, width: 200, height: 50)
        view.layer.addSublayer(gradientLayer)
        
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.cyan.cgColor]
        
        // 对应colors中每一个颜色作用区域范围
//        gradientLayer.locations = [0.0, 1]
        
        // 控制渐变方向
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)

    }
    
    func setupReplicatorLayer() -> Void {
        let replicatorLayer = CAReplicatorLayer()
        replicatorLayer.backgroundColor = UIColor.gray.cgColor
        replicatorLayer.frame = CGRect(x: 12, y: 430, width: 300, height: 200)
        view.layer.addSublayer(replicatorLayer)
        
        replicatorLayer.instanceCount = 6
        
        var transform = CATransform3DIdentity
        transform = CATransform3DMakeTranslation(0, -30, 0)
        transform = CATransform3DRotate(transform, .pi / 6, 0, 0, 1)
        transform = CATransform3DTranslate(transform, 0, 30, 0)
        replicatorLayer.instanceTransform = transform
        
        replicatorLayer.instanceBlueOffset = -0.1
        replicatorLayer.instanceGreenOffset = -0.1
        
        let layer = CATextLayer()
        layer.foregroundColor = UIColor.white.cgColor
        layer.string = "1"
        layer.alignmentMode = CATextLayerAlignmentMode(rawValue: "center")
        layer.frame = CGRect(x: 125, y: 140, width: 50, height: 50)
        layer.backgroundColor = UIColor.cyan.cgColor
        replicatorLayer.addSublayer(layer)
    }
}
