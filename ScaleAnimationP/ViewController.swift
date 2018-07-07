//
//  ViewController.swift
//  ScaleAnimationP
//
//  Created by 大鲨鱼 on 2018/7/6.
//  Copyright © 2018年 大鲨鱼. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let buttonn = UIButton()
    let time:TimeInterval = 1.0
    
    var circle1:UIImageView = UIImageView()
    var circle2:UIImageView = UIImageView()
    var circle3:UIImageView = UIImageView()
    
    let circle = UIImageView()
    let imageView = UIImageView()
    
    //下面是动画的主角圆形属性函数
    func publicCircle() -> UIImageView {
        let circle = UIImageView()
        circle.frame.size = CGSize(width: 60, height: 60)
        circle.center.x = self.view.bounds.width / 2
        circle.center.y = self.view.bounds.height / 2
        circle.layer.cornerRadius = 30
        circle.backgroundColor = UIColor(red: 255, green: 0, blue: 0, alpha: 0.2)
        return circle
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //下面这个是头像
        let img = UIImage(named: "head")
        let head = UIImageView(image: img)
        head.frame.size = CGSize(width: 120, height: 120)
        //下面这句是填充为等比直充满
        head.contentMode = .scaleAspectFill
        //下面这句是设置遮罩
        head.layer.masksToBounds = true
        //下面这句设置为圆形
        head.layer.cornerRadius = head.frame.width / 2
        head.center.x = self.view.bounds.width / 2
        head.center.y = self.view.bounds.height / 2
//        head.layer.borderWidth = 4
//        head.layer.borderColor = UIColor.white
        self.view.addSubview(head)
        
        
        //下面这个是蓝色的圆形
        self.circle1 = publicCircle()
        self.circle1.backgroundColor = UIColor(red: 0, green: 0, blue: 255, alpha: 0.16)
        self.view.addSubview(self.circle1)
 
        //下面这个是红色的圆形
        self.circle2 = publicCircle()
        self.circle2.backgroundColor = UIColor(red: 0, green: 0, blue: 255, alpha: 0.24)
        self.view.addSubview(self.circle2)
        
        //下面这个是绿色的圆形
        self.circle3 = publicCircle()
        self.circle3.backgroundColor = UIColor(red: 0, green: 0, blue: 255, alpha: 0.3)
        self.view.addSubview(self.circle3)
        
        //下面是点击更换文字最大的按钮 btn
        buttonn.frame.size = CGSize(width: 180, height: 50)
        buttonn.center.x = self.view.bounds.width / 2
        buttonn.center.y = self.view.bounds.height - buttonn.frame.height
        buttonn.setTitle("Click", for: .normal)
        buttonn.setTitleColor(UIColor.black, for: .normal)
        buttonn.setTitleColor(UIColor.white, for: .highlighted)
        buttonn.backgroundColor = UIColor.yellow
        buttonn.adjustsImageWhenHighlighted = false
        self.view.addSubview(buttonn)
        buttonn.addTarget(self, action: #selector(highlightBg), for: .touchDown)
        buttonn.addTarget(self, action: #selector(click), for: .touchUpInside)


        
        //下面是高速图层顺序的
        self.view.bringSubview(toFront: head)
        self.view.sendSubview(toBack: self.circle1)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //下方是变透明的函数(后来并没有用到)
    func scaleAnimation0() {
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 1.0
        animation.toValue = 0.0
        animation.duration = 2.0
        self.imageView.layer.add(animation, forKey: "Image-opacity")
        self.imageView.alpha = 0
    }
    
    //下面是动画的函数
    func scaleAnimation1() {
        //创建一个动画
        let animation = CABasicAnimation()
        let animation2 = CABasicAnimation()
        let animation3 = CABasicAnimation()
        let animation4 = CABasicAnimation()
        let animationOpacity = CABasicAnimation()
        //设置动画变透明的参数
        animationOpacity.toValue = 0.0
        animationOpacity.duration = 1
        animationOpacity.keyPath = "opacity"
        //设置动画常规放大参数1
        animation.keyPath = "transform.scale"
        animation.beginTime = CACurrentMediaTime() + 0
        animation.toValue = 10.0
        animation.duration = 1
//        animation.fromValue = 1.0
//        animation.repeatCount = 5
//        animation.isRemovedOnCompletion = true
        //设置动画常规放大参数2
        animation2.keyPath = "transform.scale"
        animation2.beginTime = CACurrentMediaTime() + 0.15
        animation2.toValue = 9.6
        animation2.duration = 0.85
        //设置动画常规放大参数3
        animation3.keyPath = "transform.scale"
        animation3.beginTime = CACurrentMediaTime() + 0.3
        animation3.toValue = 9.4
        animation3.duration = 0.7

        //button 点击缩小动画
        animation4.keyPath = "transform.scale"
        animation4.toValue = 0.9
        animation4.duration = 0.1
        
        //把动画添加到当前页面中
        self.circle1.layer.add(animation, forKey: "Image-expend")
        self.circle1.layer.add(animationOpacity, forKey: "Image-opacity")
        self.circle2.layer.add(animation2, forKey: "Image-expend")
        self.circle2.layer.add(animationOpacity, forKey: "Image-opacity")
        self.circle3.layer.add(animation3, forKey: "Image-expend")
        self.circle3.layer.add(animationOpacity, forKey: "Image-opacity")
        self.buttonn.layer.add(animation4, forKey: "Image-expend")
    }

    @objc func highlightBg() {
        print("highlightBorder")
//        buttonn.layer.backgroundColor = (UIColor.black as! CGColor)
    }

    //点击后执行循环
    @IBAction func click (_sender:ACTION){
        var count:Float = 0
        while count < 10 {
            count += 1
            print("计数是\(count)")
            scaleAnimation1()
        }
    }
}

