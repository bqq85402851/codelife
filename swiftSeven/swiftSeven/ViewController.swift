//
//  ViewController.swift
//  swiftSeven
//
//  Created by 英策网络科技 on 16/8/4.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let city = ["1","2","3","4","5"]
        print(倒序("2", b: "1"))
        let city1 = city.sort(倒序)
        print(city1)
        let city2 = city.sort({(a:String,b:String) -> Bool in
        return a<b
        })
        print(city2)
        let city3 = city.sort{(a,b) in
            a>b
        }
        print(city3)
        let city4 = city.sort{
        $0 > $1
        }
        print(city4)
        let city5 = city.sort(){
           $0>$1
        }
        print(city5)
        let 闭包1 = 闭包(1, b: 2){(a:Int,b:Int) -> Int in
            a+b
        }
        print(闭包1)
        let 闭包2 = 闭包(1, b: 2, c: {a,b in
            a-b
        })
        print(闭包2)
    }
    func 倒序(a:String,b:String)->Bool{
    return a>b
    }
    func 闭包(a:Int,b:Int,c:(Int,Int)->Int)->Int{
    return c(a,b)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

