//
//  ViewController.swift
//  Gesture
//
//  Created by apple on 2018/12/1.
//  Copyright © 2018年 yx. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func add(_ sender: Any) {
        let _: CGFloat = 150

        let x = CGFloat(arc4random() % UInt32(self.view.bounds.width))
        let y = CGFloat(arc4random() % UInt32(self.view.bounds.height - 40)) + 40
        let point = CGPoint(x: x, y: y)
        
        let width = 60
        let height = 60
        let size = CGSize(width: width, height: height)
        
        let view = MyView(frame: CGRect(origin: point, size: size))
        
        self.view.addSubview(view)
    }
    
    
    @IBAction func move(_ sender: Any) {

        for view in self.view.subviews {
            if(view is MyView){
                let x = CGFloat(arc4random() % UInt32(self.view.bounds.width))
                let y = CGFloat(arc4random() % UInt32(self.view.bounds.height - 40)) + 40
                let point = CGPoint(x: x, y: y)
                
                UIView.animate(withDuration: 3, animations: {
                    view.center = point
                })
            }
            
            
        }
    }
    
    @IBAction func clear(_ sender: Any) {
//        self.view.subviews.map { $0.removeFromSuperview() }
        for view in self.view.subviews {
             if(view is MyView){
            view.removeFromSuperview()
            }
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

