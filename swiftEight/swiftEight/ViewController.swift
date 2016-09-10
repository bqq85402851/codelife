//
//  ViewController.swift
//  swiftEight
//
//  Created by 英策网络科技 on 16/8/4.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        enum 天气 {
            case 晴
            case 阴
            case 雨
            case 霾
            case 冰雹
            case 雪
            case 雾
            func des() -> String{
                switch self{
                case .晴:
                    return "晴天"
                case .阴:
                    return "阴天"
                case .冰雹:
                    return "下冰雹了"
                case .雨:
                    return "下雨了"
                case .霾:
                    return  "有雾霾"
                case .雪:
                    return "下雪了"
                default:
                    return "未知天气"
                }
            }
        }
        let 杭州今天的天气 = 天气.晴
        print(杭州今天的天气.des())
        switch 杭州今天的天气{
        case .晴:
            print("今天天气不错")
        case .阴:
            print("my god , 是阴天")
        case .冰雹:
            print("下冰雹了")
        default:
            break
        }
        
        enum 精确天气{
        case 晴(Int,Int,String)
        case 霾(String,Int)
        }
        var 杭州今日的精确天气 = 精确天气.晴(38, 50, "晴")
        var 上海今日的精确天气 = 精确天气.霾("PM10", 100)
        杭州今日的精确天气 = 精确天气.霾("PM10", 100)
        上海今日的精确天气 = 精确天气.晴(38, 50, "晴")
        switch 杭州今日的精确天气 {
        case .晴(let uvi, let li, let desc):
            print("紫外线指数:\(li),温度:\(uvi),天气:\(desc)")
        case .霾(let cat, let index):
            print("雾霾颗粒类别:",cat,"指数:",index)
        }
        switch 上海今日的精确天气 {
        case .晴(let uvi, let li, let desc):
            print("紫外线指数:\(li),温度:\(uvi),天气:\(desc)")
        case .霾(let cat, let index):
            print("雾霾颗粒类别:",cat,"指数:",index)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

