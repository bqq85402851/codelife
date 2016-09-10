//
//  ViewController.swift
//  swiftTen
//
//  Created by 英策网络科技 on 16/8/4.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        class 角色{
            let id:String = "小波"
            var money:Int = 9999
        }
        let 人物1 = 角色()
        print(人物1.id)
        print(人物1.money)
        
        class 地图{
        var filename = "死亡沙漠.map"
        }
        class 战士:角色{
        lazy var 打怪地图 = 地图()
            var 进入副本 = true
        }
        let 战士1 = 战士()
        if 战士1.进入副本{
        print(战士1.打怪地图)
        }
        
        struct 坐标{
        var x = 0,y = 0
        }
        enum 移动方式{
            case 走
            case 跑
            case 骑
            case 传送
        }
        class 法师:角色{
            var 人物坐标 = 坐标()
            var 人物移动方式 = 移动方式.走
            var 当前坐标:坐标{
                get{
                    switch 人物移动方式{
                    case .走:
                        人物坐标.x += 1
                        人物坐标.y += 1
                    case .跑:
                        人物坐标.x += 3
                        人物坐标.y += 3
                    case .骑:
                        人物坐标.x += 10
                        人物坐标.y += 10
                    case .传送:
                        人物坐标.x += 1000
                        人物坐标.y += 1000
                    }
                    return 人物坐标
                }
                set{
                人物坐标 = newValue
                }
            }
        }
        
        let 法师1 = 法师()
        print(法师1.当前坐标)
        法师1.人物移动方式 = .跑
        print(法师1.当前坐标)
        法师1.当前坐标 = 坐标(x: 2000, y: 90)
        print(法师1.人物坐标)
        
        class 经验{
            var 总经验: Int = 0{
                willSet{
                print("当前总经验是:\(newValue)!")
                }
                didSet {
                print("增加了\(总经验 - oldValue)点经验!")
                }
            }
        }
        let 经验1 = 经验()
        经验1.总经验 = 1000
        经验1.总经验 = 3000
        经验1.总经验 = 8000
        print(经验1.总经验)
        
        class 生命体{
            class var 遗传方式: String {
                return "RNA"
            }
        }
        class Human:生命体{
            override class var 遗传方式:String{
            return "DNA"
            }
        }
        print(生命体.遗传方式)
        print(Human.遗传方式)
        struct 逛街{
            static let 最大负载 = 30
            static let 试衣间 = "UNICLO"
            static let 网站 = "http://www.taobao.com/shopname="
            var 参数 = ""
            var 请求网址:String{
            return 逛街.网站 + 参数
            }
        }
        print(逛街.试衣间)
        let 逛淘宝 = 逛街(参数: "生鲜")
        print(逛淘宝.请求网址)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

