//
//  ViewController.swift
//  swiftEleven
//
//  Created by 英策网络科技 on 16/8/4.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

import UIKit
enum 英雄列表:String{
    case 盖伦 = "德玛西亚"
    case 希维尔 = "胜利女神"
    case 赵信 = "德邦总管"
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let hero = 英雄列表.希维尔
        print(hero.rawValue)
        /**
        实例方法
        */
        enum 怪物经验表:Int{
            case 骷髅 = 80
            case 投掷骷髅 = 100
            case 骷髅魔王 = 100000
        }
        struct 服务器经验倍数{
            var 开启 = false
            var 倍数 = 1
        }
        class 人民币玩家{
            var 经验值 = 0
            var 经验倍数 = 服务器经验倍数()
            func 挂机经验(){
            经验值 += 500
                print("挂机成功一次!经验为\(经验值)")
            }
            func 打怪经验(怪物:怪物经验表,经验倍数:Int){
                let 怪物经验值 = 怪物.rawValue
                self.经验值 += (怪物经验值 * 经验倍数)
                if self.经验倍数.开启 && self.经验倍数.倍数 > 1{
                经验值 *= self.经验倍数.倍数
                }
                print("当前打怪经验值\(self.经验值)")
            }
        }
        let 小波 = 人民币玩家()
        小波.挂机经验()
        
        小波.打怪经验(怪物经验表.骷髅魔王, 经验倍数: 3)
        
        小波.经验倍数.开启 = true
        小波.经验倍数.倍数 = 3
        小波.打怪经验(怪物经验表.骷髅, 经验倍数: 6)
        
        struct 角色坐标{
        var x = 0,y = 0
            mutating func 安全区坐标(x: Int , y: Int){
                self.x = x
                self.y = y
                print("当前回到安全区域,坐标是\(self.x),\(self.y)")
            }
        }
        var 我的坐标 = 角色坐标()
        print(我的坐标.x,我的坐标.y)
        我的坐标.安全区坐标(888, y: 666)
    
        enum 猜拳 {
        case 石头,剪刀,布
            static let game = "猜拳"
            mutating func 开始(){
                switch self{
                case 剪刀:
                    self = 布
                case 石头:
                    self = 剪刀
                case 布:
                    self = 石头
                }
            }
        }
        var 小波2 = 猜拳.剪刀
        小波2.开始()
        print(小波2)
        
        /**
        类方法
        */
        class 玩家{
        static var 姓名 = "小波"
            class func 服务器名() {
                print("\(姓名),您在杭州网通一区")
            }
        }
        class lol玩家:玩家{
            override class func 服务器名(){
            print("\(姓名),您现在是一名LOL玩家")
            }
        }
        
        lol玩家.服务器名()
        
        struct 复活{
        static var hp = 100
            static func 复活点(当前区域:String){
            print("您在\(当前区域)复活,HP是\(hp)")
            }
        }
        复活.复活点("北京")
        
        struct 圆{
            func 面积(半径:Double)->Double{
            return M_PI * pow(半径,2)
            }
            subscript(半径:Double)->Double{
            return M_PI * pow(半径, 2)
            }
        }
        struct Matrix{
            var rows , cols :Int
            var grid:[Int]
            init(rows:Int,cols:Int){
                self.rows = rows
                self.cols = cols
                
                grid = Array(count: rows * cols, repeatedValue: 0)
            }
            func indexIsValid(row:Int,col:Int) -> Bool{
            return row >= 0 && row < rows && col >= 0 && col < cols
            }
            subscript(row:Int,col:Int) ->Int{
                get{
                    assert(indexIsValid(row, col: col), "数组索引越界")
                    return grid[col+(row*cols)]
                }
                set{
                    assert(indexIsValid(row, col: col), "数组索引越界")
                    grid[col+(row*cols)] = newValue
                }
            }
        }
        var matrix1 = Matrix(rows: 3, cols: 3)
        var a = 0
        for x in 0..<3{
            for y in 0..<3{
               matrix1[x,y] = a++
            }
        }
        print(matrix1[0,0],matrix1[2,2])
        
        class people {
            var age :Int
            var sex :String
            init(age:Int,sex:String){
               self.age = age
               self.sex = sex
            }
            func des(){
            print("这个人\(self.age)岁,性别:\(self.sex)")
            }
        }
        class worker:people{
            override func des() {
                //super.des()
                print("这是个工人")
            }
        }
        let work2 = worker(age: 20, sex: "女")
        work2.des()
        
        struct OfficeTemp{
            var 季节:String
            var 温度:Int
        }
        let office = OfficeTemp(季节: "夏天", 温度: 100)
        print(office.季节,office.温度)
        
        class Food{
            var name :String
            init(name:String){
            self.name = name
            }
            convenience init(){
                self.init(name:"没有名称的食物")
            }
        }
        let 无名食物 = Food()
        print(无名食物.name)
        
        class Menu:Food{
            var count:Int
            init(name:String,count:Int){
               self.count = count
               super.init(name:name)
            }
            convenience override init(name:String){
                self.init(name:name,count:1)
            }
        }
        let menu1 = Menu()
        print(menu1.count,menu1.name)
        
        let back = UIView(frame:CGRectMake(0, 0, 100, 100))
        back.backgroundColor = UIColor.blackColor()
        self.view.addSubview(back)
        
        let hcxySlon = UIImage(named: "logo")
        let hcxyBanner = UIImage(named: "banner.jpg")
        print(hcxySlon,hcxyBanner)
        
        struct Animal {
            var name : String
            init?(name:String){
                if name.isEmpty{
                   print("动物没有名字")
                    return nil
                }
                self.name = name
            }
            
        }
        let elepant = Animal(name: "")
        print(elepant,elepant?.name.fastestEncoding.description)
        
        let label = UILabel(frame:CGRectMake(0, 100, 100, 30))
        label.text = "这是一个label"
        label.textColor = UIColor.blueColor()
        label.textAlignment = NSTextAlignment.Center
        label.adjustsFontSizeToFitWidth = true
        self.view.addSubview(label)
        
        func aFoo() throws {
        print("这是一个bug")
        }
        enum 学习障碍:ErrorType{
            case 没方法,不想看书,缺学习工具(tool:String)
        }
        func iosDev(方法:Bool,方式:Bool,工具:Bool) throws {
            guard 方法 else{
            throw 学习障碍.没方法
            }
            guard 方式 else{
            throw 学习障碍.不想看书
            }
            guard 工具 else{
            throw 学习障碍.缺学习工具(tool: "Mac book")
            }
        }
        var 预算 = 7000
        func buy(工具:String){
            if 预算 >= 6000{
            预算 -= 6000
                print("您已经采购",工具,"花费6000元,余额",预算)
            }else{
               print("资金不足!")
            }
        }
        do {
            try iosDev(true, 方式: true, 工具: false)
            print("恭喜您卖出了第一步~")
        }catch 学习障碍.没方法{
        print("努力自学")
        }catch 学习障碍.不想看书{
        print("打自己一顿")
        }catch 学习障碍.缺学习工具(tool: let mac){
        buy(mac)
        }catch {
        
        }
        
        if let _ = try? iosDev(true, 方式: false, 工具: true){
        print("恭喜,您已经开始学习")
        } else {
        print("条件不足,无法学习")
        }
        print(try! iosDev(true, 方式: true, 工具: true))
        
        func pk(){
            defer{
            print("Game over")
            }
            defer{
            print("``````")
            }
            defer{
            print("1111")
            }
            print("Ready?GO!")
            
            print("Fight!")
            print("哈哈哈")
        }
        pk()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

