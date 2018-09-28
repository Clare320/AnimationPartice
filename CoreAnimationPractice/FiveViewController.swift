//
//  FiveViewController.swift
//  CoreAnimationPractice
//
//  Created by kede on 2018/9/28.
//  Copyright © 2018 Clare320. All rights reserved.
//

import UIKit

class FiveViewController: UIViewController {

    @IBOutlet weak var movedCube: UIView!
    @IBOutlet weak var blackCube: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func move50ToLeft(_ sender: Any) {
        let transform = movedCube.layer.affineTransform()
        movedCube.layer.setAffineTransform(transform.translatedBy(x: -50, y: 0))
    }
    
    @IBAction func move50ToRight(_ sender: Any) {
        let transform = movedCube.layer.affineTransform()
        movedCube.layer.setAffineTransform(transform.translatedBy(x: 50, y: 0))
    }
    
    @IBAction func rotate(_ sender: Any) {
        let transform = movedCube.layer.affineTransform()
        movedCube.layer.setAffineTransform(transform.rotated(by: .pi/4))
    }
    
    @IBAction func reset(_ sender: Any) {
        movedCube.layer.setAffineTransform(CGAffineTransform.identity)
    }
    
    
    @IBAction func handle3DAffineTranform(_ sender: UIButton) {
        var transform = blackCube.layer.transform
        
        let index = sender.tag
        switch index {
        case 0:
            blackCube.layer.transform = CATransform3DMakeTranslation(50, 0, 30)
        case 2:
            transform.m34 = -1/500.0
            blackCube.layer.transform = CATransform3DRotate(transform, .pi/4, 1, 0, 0)
        case 3:
            blackCube.layer.transform = CATransform3DIdentity
        default:
            print("no action")
        }
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
