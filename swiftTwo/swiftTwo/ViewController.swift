//
//  ViewController.swift
//  swiftTwo
//
//  Created by 英策网络科技 on 16/7/26.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var b = "德玛西亚,永世长存"
        let a = ""
        print(b.isEmpty)
        print(a.isEmpty)
        
        let c : Character = "哈"
        let d  : Character = "呵"
        for x in b.characters{
        print("\(x)\(c)\(d)")
        }
        b.append(c)
        b.append(d)
        print(b)
        
        let u_a = "\u{515c}"
        let u_b = "\u{4e8b}"
        print("\(u_a)\(u_b)")
        
        print(b.characters.count)
        print("\(b[b.startIndex])\(b[b.endIndex.predecessor()])")
        
        for var i = 0 ; i<b.characters.count; ++i{
           print(b[b.startIndex.advancedBy(i)])
        }
        for c_a in b.characters.indices{
            print(b[c_a],terminator:"_")
            print(c_a)
        }
        b.insert("!", atIndex: b.endIndex)
        print(b)
        let s_a = "诺克萨斯"
        b.insertContentsOf(s_a.characters, at: b.endIndex)
        print(b)
        
        let h_y = "\u{1112}\u{1161}\u{11ab}"
        let h_z = "\u{d55c}"
        print(h_y==h_z)
        
        //前缀
        print(b.hasPrefix(s_a))
        //后缀
        print(b.hasSuffix(s_a))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

