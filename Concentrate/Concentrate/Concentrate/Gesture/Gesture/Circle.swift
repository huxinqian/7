//
//  Circle.swift
//  Gesture
//
//  Created by apple on 2018/12/1.
//  Copyright © 2018年 yx. All rights reserved.
//

import UIKit

@IBDesignable
class Circle: UIView {
    
    @IBInspectable var color: UIColor?
    
    override func draw(_ rect: CGRect) {
        let viewRect = UIBezierPath(rect: rect)
        
        let redColor = CGFloat(Float(arc4random() % 255) / 255)
        let greenColor = CGFloat(Float(arc4random() % 255) / 255)
        let blueColor = CGFloat(Float(arc4random() % 255) / 255)
    
        UIColor(red: redColor, green: greenColor, blue: blueColor, alpha:
            1.0).set()
        
        viewRect.stroke()
        viewRect.fill()
    }
    
    //重写初始化函数
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    //另一个初始化函数 把添加的功能放在setup里CGRect
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        //设置矩形区域圆角
        self.layer.cornerRadius = 20
        //设置阴影
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 5, height: 5)
        self.layer.shadowOpacity = 0.8
        //设置视图的内容模式为重绘
        self.contentMode = .redraw
        
        //pan移动
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(pan(gesture:)))
        self.addGestureRecognizer(panGesture)
        
        //tap删除
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tap(gesture:)))
        self.addGestureRecognizer(tapGesture)
        
        //pinch缩放
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinch(gesture:)))
        self.addGestureRecognizer(pinchGesture)
        
        //rotation旋转
        let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(rotation(gestrue:)))
        self.addGestureRecognizer(rotationGesture)
    }
    //pan移动
    @objc func pan(gesture: UIPanGestureRecognizer) {
        self.center = gesture.location(in: superview)
    }
    
    //tap删除
    @objc func tap(gesture: UITapGestureRecognizer) {
        self.removeFromSuperview()
    }
    
    //pinch缩放
    @objc func pinch(gesture: UIPinchGestureRecognizer) {
        let scale = gesture.scale
        self.transform = self.transform.scaledBy(x: scale, y: scale)
        gesture.scale = 1
    }
    
    //rotation旋转
    @objc func rotation(gestrue: UIRotationGestureRecognizer) {
        let rotation = gestrue.rotation
        self.transform = self.transform.rotated(by: rotation)
        gestrue.rotation = 0
    }
   
    

}
