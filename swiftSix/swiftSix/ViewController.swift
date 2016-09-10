//
//  ViewController.swift
//  swiftSix
//
//  Created by 英策网络科技 on 16/8/4.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

import UIKit
/// 函数
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(加法(3, b: 7))
        问候()
        print(maxMin().0,maxMin().1)
        print(add(b: 100))
        print(sum(1,2,1,3,5))
        let s = 加法
        print(我的加法(s, b: 1, c: 1))
        print(addOrSub1(true)(1))
        let c = addOrSub1(false)
        print(c(1)) 
    }
    /**
     加法
     */
    func 加法(a:Int,b:Int) -> Int{
    return a+b
    }
    /**
     无参无返回值
     */
    func 问候(){
        print("你好")
        print("halo")
        print("呵呵哒")
    }
    /**
     多返回值
     */
    func maxMin() -> (Int,Int){
    return (Int.max,Int.min)
    }
    /**
     函数默认值
     */
    func add(a:Int = 2,b:Int) -> Int{
    return a+b
    }
    /**
     不定参数
     */
    func sum(numbers:Int...) -> Int{
        var result = 0
        for number in numbers{
        result += number
        }
        return result
    }
    /**
     包含参数和返回类型的简写形式
     */
    func 我的加法(a:(Int,Int)->Int,b:Int,c:Int)->Int{
    return a(b,c)
    }
    /**
     返回参数
     */
    func addOrSub1(正数:Bool) -> (Int)->Int{
        if 正数 {
        return add1
        }else{
        return sub1
        }
    }
    func add1(a:Int)->Int{
    return a+1
    }
    func sub1(a:Int)->Int{
    return a-1
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

