//
//  ViewController.swift
//  generalSwift
//
//  Created by 英策网络科技 on 16/8/16.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

import UIKit
struct Stack<Element> {
    var items = [Element]()
    mutating func push(item:Element){
    items.append(item)
    }
    mutating func pop(item:Element)->Element{
     return items.removeLast()
    }
}
protocol 容器{
    typealias ItemType
    mutating func append(item:ItemType)
    var count:Int{get}
    subscript(i:Int) ->ItemType{get}
}
struct IntStack:容器{
    var items = [Int]()
    mutating func push(item:Int){
    items.append(item)
    }
    mutating func pop(item:Int)->Int{
    return items.removeLast()
    }
    mutating func append(item: ItemType) {
        self.push(item)
    }
    var count :Int{
    return items.count
    }
    subscript(i:Int)->Int{
    return items[i]
    }
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        打印任意数组元素([1,2,3])
        打印任意数组元素(["我是","萌萌哒","程序猿"])
        打印任意数组元素([1.2,5.6,2.8])
        
        var a = 3
        var b = -99
        swap(&a, &b)
        print(a,b)
        
        var Swift大神 = Stack<String>()
        Swift大神.push("Matttt")
        Swift大神.push("学习")
        Swift大神.push("大神")
        Swift大神.push("星期一")
        let 菜鸟 = Swift大神.pop("小波")
        print(菜鸟)
        let 位置 = 查位置(["刘备","关羽","张飞"], 待查元素: "张飞")
        print(位置)
        
        
    }
    func 打印任意数组元素<类型占位符>(数组:[类型占位符]){
        for 元素 in 数组{
        print(元素)
        }
    }
    func 查位置<Elemet:Equatable>(文本数组:[Elemet],待查元素:Elemet)->Int?{
        for (位置,值) in 文本数组.enumerate(){
            if 值 == 待查元素{
            return 位置
            }
        }
        return nil
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

