//
//  ViewController.swift
//  fifteenSwiftTwo
//
//  Created by 英策网络科技 on 16/8/8.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

import UIKit
protocol 产生随机的协议{
    func 随机方法() ->Int
}
struct Role {
    var name:String
    var attack:Int
    var defence:Int
}
/// 玩游戏
protocol lolgame{
    var role:Role{
    get
    }
    mutating func play()
}
/// 游戏代练协议
protocol lolgameDelegate{
    func gameStart(game:lolgame) ->Int
    func gameRolePK(game:lolgame,armed:Bool) ->Int
    func gameOver(game:lolgame) ->Int
}
/// 实现游戏代练
struct GameAgent:lolgameDelegate{
    func gameStart(game: lolgame) -> Int {
        print(game.role.name,"开始打怪升级","起始经验:2000")
        return 2000
    }
    func gameRolePK(game: lolgame, armed: Bool) -> Int {
        if armed{
        print(game.role.name,"您有武器,获得经验:5000")
            return 5000
        }else{
        print(game.role.name,"您赤手空拳,只获得经验:2500,有武器会加倍哦!")
            return 2500
        }
    }
    func gameOver(game: lolgame) -> Int {
        print(game.role.name,"您已经正常退出,获得经验1000")
        return 1000
    }
}
struct PlayGame:lolgame {
    var exp:Int
    var gameAgent:GameAgent?
    let role = Role(name: "德玛西亚", attack: 2000, defence: 5000)
    mutating func play() {
        if let gameAgent = gameAgent{
        print("您使用了代练!")
            
            exp += gameAgent.gameStart(self)
            exp += gameAgent.gameRolePK(self, armed: true)
            exp += gameAgent.gameOver(self)
        }else{
        print("没有使用任何代练或挂机,不会自动升级")
        }
        print("一共经验值是:",exp)
    }
}

protocol showIntHint{
    func hint() -> String
}
extension Int:showIntHint{
    func hint() ->String{
        return "整数:\(self)"
    }
}

struct MyText{
    var text:String
    var description:String{
        return "我的自定义显示:" + text
    }
}
extension MyText:CustomStringConvertible{}

extension showIntHint where Self:CustomStringConvertible{
    func hint2()->String{
    return "扩展约束提示,整数:" + self.description
    }
}

extension CollectionType where Generator.Element:CustomStringConvertible {
    func newDesc()->String{
        let itemAsText = self.map{$0.description}
        return "元素数:\(self.count),值分别是:"+itemAsText.joinWithSeparator(",")
    }
}
class ViewController: UIViewController {
    struct 随机体:产生随机的协议{
        func 随机方法() -> Int {
            return Int(arc4random())
        }
    }
    struct 骰子{
        let 边:Int
        let 随机生成器:产生随机的协议
        
        func 掷() ->Int{
        return 随机生成器.随机方法()%边+1
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let 一颗骰子 = 骰子(边: 6, 随机生成器: 随机体())
        for _ in 1...30{
        print(一颗骰子.掷())
        }
        
        var playgame1 = PlayGame(exp: 0, gameAgent: nil)
        playgame1.play()
        let agentSmith = GameAgent()
        playgame1.gameAgent = agentSmith
        print(playgame1.play())
        
        let label = UILabel()
        label.frame = CGRectMake(0, 0, 100, 50);
        label.text = "毕小强的代码世界"
        label.textColor = UIColor.redColor()
        label.backgroundColor = UIColor.yellowColor()
        label.font = UIFont.systemFontOfSize(12.0)
        self.view.addSubview(label)
        
        2.hint()
        let a :Int = 3
        print(2.hint(),a.hint())
        
        print(1.description)
        let text1 = MyText(text: "CustomStringConvertible是什么")
        print(text1)
        
        print(1.hint2())
        
        let 整数组1 = [1,2,3]
        print(整数组1.newDesc())
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

