//
//  ViewController.swift
//  extensionSwift
//
//  Created by 英策网络科技 on 16/8/15.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

import UIKit
extension Double{
    var km:Double{return self*1_000.0}
    var m:Double{return self}
    var cm:Double{return self/100.0}
    var mm:Double{return self/1_000.0}
    var ft:Double{return self/3.28084}
}
struct Size {
    var width = 0.0,height = 0.0
}
struct Point {
    var x = 0.0,y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
}
extension Rect{
    init(center:Point,size:Size){
        let originX = center.x-(size.width/2)
        let originY = center.y-(size.height/2)
        self.init(origin:Point(x: originX, y: originY),size:size);
    }
}
extension Int{
    func repetitions(task:()->Void){
        for _ in 0...self{
          task()
        }
    }
}
extension Int{
    mutating func square(){
    self = self * self
    }
}
extension Int{
    subscript(didgitIndex:Int)->Int{
    var decimalBase = 1
        for _ in 1...didgitIndex{
        decimalBase *= 10
        }
    return (self/decimalBase)%10
    }
}
extension Character{
    enum Kind{
    case Vowel,Consonant,Other
    }
    var kind:Kind{
        switch String(self).lowercaseString{
        case "a","e","i","o","u":
            return .Vowel
        case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
        "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
            return .Consonant
        default:
            return .Other
        }
    }
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let oneInch = 25.4.mm
        print(oneInch)
        let threeFeet = 3.ft
        print(threeFeet)
        let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))
        print(centerRect)
        let menberwiseRest = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 3.0, height: 3.0))
        print(menberwiseRest)
        3.repetitions { () -> () in
            print("Hello")
        }
        3.repetitions{
            print("GoodBye")
        }
        var someInt = 3
        someInt.square()
        print(someInt)
        
        print(746381295[1])
        
        printLetterKinds("apple")
    }
    func printLetterKinds (word : String){
        for character in word.characters{
            switch character.kind{
            case .Vowel:
                print("vowel")
            case .Consonant:
                print("consonant")
            case .Other:
                print("other")
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

