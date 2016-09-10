//
//  ViewController.swift
//  closureSwift
//
//  Created by 英策网络科技 on 16/8/16.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        print(names.sort(backwards))
        
        let didgitNames = [0:"Zero",1:"One",2:"Two",3:"Three",4:"Four",5:"Five",6:"Six",7:"Seven",8:"Eight",9:"Nine"]
        let numbers = [16,58,510]
        let strings = numbers.map{
        (var number) -> String in
            var output = ""
            while number > 0{
            output = didgitNames[number % 10]!+output
                number /= 10
            }
            return output
        }
        print(strings)
    
    }
    func backwards(s1:String,s2:String)->Bool{
    return s1>s2
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

