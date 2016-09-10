//
//  ViewController.swift
//  swiftFifteen
//
//  Created by 英策网络科技 on 16/8/6.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

import UIKit

/// 协议
protocol 第一协议{
    var 独和写:Int{get set}
    var 只读:Int{get}
}
protocol 另一个协议{
    static var 某类型属性:Int{set get}
}
protocol 全名{
    var 姓:String{get}
    var 名:String{get}
}
protocol 某协议{
    static func 一个类型方法()
    static func 传参数 (a:Int)
}
protocol 开关协议{
    mutating  func 切换状态()
}
protocol 某带参数的构造方法协议{
    init(某函数:Int)
}
protocol 某构造方法协议{
    init()
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        struct 学生:全名{
            var 姓:String
            var 名:String
        }
        var 学生1 = 学生(姓: "小", 名: "强")
        学生1.名 = "哈哈"
        print(学生1.姓,学生1.名)
        
        class 人物:全名{
            var 名头:String?
            var 人物名:String
            init(名头:String?,人物名:String){
            self.名头 = 名头
                self.人物名 = 人物名
            }
            var 姓:String{
            return 名头 ?? ""
            }
            var 名:String{
            return 人物名
            }
        }
        let 人物1 = 人物(名头: "战神", 人物名:"小波")
        print(人物1.名头,人物1.人物名,人物1.名,人物1.姓)
        
        class 某类:某协议{
            class func 一个类型方法() {
                print("可override的类型方法实现")
            }
            class func 传参数(a: Int) {
                
            }
        }
        某类.一个类型方法()
        class 另一个类:某协议{
            static func 一个类型方法() {
                print("不可override的类型方法实现")
            }
            class  func 传参数(a: Int) {
                print(a)
            }
        }
        另一个类.一个类型方法()
    
        enum 开关枚举:开关协议{
        case 开,关
             mutating func 切换状态() {
                switch self {
                case .关:
                    self = .开
                case .开:
                    self = .关
                }
            }
        }
        var 门 = 开关枚举.开
        门.切换状态()
        print(门.hashValue)
        
        class 某带参数的类:某带参数的构造方法协议{
            required init(某函数: Int) {
                
            }
        }
        class 父类 {
            init (){
                
            }
        }
        class 子类:父类,某构造方法协议{
            override required init (){
                
            }
        }


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

