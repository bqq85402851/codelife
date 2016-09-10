//
//  ViewController.swift
//  swiftThree
//
//  Created by 英策网络科技 on 16/8/3.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        /**
        数组  有序可重复集合
        */
        var 一箱牛奶商品:Array<String>
        let 一箱豆奶:[String]
        一箱牛奶商品 = ["畅优","光明","完达山"]
        一箱豆奶 = ["维维","欢乐","开怀"]
        print(一箱豆奶.count)
        print(一箱牛奶商品[一箱牛奶商品.endIndex.predecessor()])
        
        let 一箱12盒光明牛奶 = [String](count: 12, repeatedValue: "优乐美")
        for x in 一箱12盒光明牛奶.indices {
            print("\(x)-\(一箱12盒光明牛奶[x])")
        }
        print(一箱12盒光明牛奶.indices)
        
        let 一到一百 = Array(1...100)
        print(一到一百.indices)
        
        一箱牛奶商品 += 一箱豆奶
        for x in 一箱牛奶商品{
            print(x)
        }
        一箱牛奶商品.insert("优乐美", atIndex: 一箱牛奶商品.endIndex.predecessor())
        print(一箱牛奶商品.endIndex.predecessor())
        
        /**
        集合  无序 不重复
        */
        let 一群友身份证号 :Set<String> = ["123", "456", "789", "12X", "123"]
        let 二群友身份证号:Set = ["333", "456", "666", "12X", "091"]
        let  二群友身份证号数组 = 一群友身份证号.sort()
        print(一群友身份证号.count)
        for x in 二群友身份证号数组{
            print(x);
        }
        for x in 一群友身份证号{
        print(x)
        }
        print(二群友身份证号数组[0])
        print(一群友身份证号.contains("123"))
        
        //交集
        print(一群友身份证号.intersect(二群友身份证号))
        //补集
        print(一群友身份证号.exclusiveOr(二群友身份证号))
        //差集
        print(一群友身份证号.subtract(二群友身份证号))
        //并集
        print(一群友身份证号.union(二群友身份证号))
        
        let set1: Set = [1,2,3,4,5]
        let set4: Set = [5,4,3,2,1]
        let set100: Set = [100,101,102]
        let set2:Set = [4,5,6,7,8]
        let set3:Set = [1,2,3,4,5,6,7,8]
        
        print("set1\(set1.isSubsetOf(set3)) set3的子集")
        print("set1\(set1.isStrictSubsetOf(set4)) set4的严格子集")
        print("set1和set100\(set1.isDisjointWith(set100))交集")
        print("set1和set3\(set1.isDisjointWith(set3))交集")
        print("set1\(set1.isSupersetOf(set3)) set3的父集")
        print(set2.intersect(set3))
        
        /**
        字典  无序 可重复
        */
        var 机场简写对照字典:[String:String]
        机场简写对照字典 = ["PVG":"上海浦东国际机场","DLC":"大连周水子机场","DUB":"Dublin International Airport"]
        print(机场简写对照字典.count)
        机场简写对照字典["SHQ"] = "上海虹桥机场"
        print(机场简写对照字典.count)
        机场简写对照字典["SHQ"] = "上海虹桥国际机场2号航站楼"
        print("\(机场简写对照字典.count)\(机场简写对照字典["SHQ"])")
        机场简写对照字典.removeValueForKey("SHQ")
        机场简写对照字典["PVG"] = nil
        for (机场代码,机场全称) in 机场简写对照字典{
        print("\(机场代码)  \(机场全称)")
        }
        for 机场代码 in 机场简写对照字典.keys{
          print(机场代码)
        }
        let rang = 0...100
        print(rang.count)
        let 机场代码组 = [String](机场简写对照字典.keys)
        let 机场全称组 = [String](机场简写对照字典.values)
        print(机场代码组)
        print(机场全称组)
        
        打的()
        
        /**
        控制流 switch
        */
        let 坐标1 = (0,0)
        switch 坐标1 {
        case (_,0):
        print("在原点")
        case(0,0):
            print("在X轴")
        case (0,_):
            print("在Y轴")
        default:
            break
        }
        
        let 温度 = 27
        switch 温度 {
        case 0...15:
            print("不适合种植")
        case 15...25:
            print("种玉米")
        case 25...30:
            print("种香蕉,椰子")
        default:
            print("洗洗睡吧")
        }
        
        let 坐标2 = (13,12)
        switch 坐标2{
        case (0,0):
            print("原点")
        case (let x,0):
            print("在X轴上",x)
        case (0,let y):
            print("在Y轴上",y)
        case (let x,let y):
            print(x,y)
        }
        
        let 坐标3 = (11,11)
        switch 坐标3 {
        case (let x,let y) where x == y:
            print("坐标在45°对角线上")
        case (let x,let y) where x == -y:
            print("坐标在135°对角线")
        default:
            print("坐标不在任何对角线上")
        }
        
    }

    /**
     控制流  早退语句 guard
     */
    func 打的(){
        let hasKey = false
        let credit : Int? = 5
        guard hasKey else {
            print( "hasKey")
        return
        }
        guard let mycredit = credit where mycredit >= 6 else {
            print("mycredit")
        return
        }
        print("欢迎欢迎")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

