//
//  ViewController.swift
//  SwiftOne
//
//  Created by 英策网络科技 on 16/7/19.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//
 /// swift基础 第一节

import UIKit
typealias 整型 = Int
typealias 布尔值 = Bool
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let isNetwork: Bool = true
        assert(isNetwork,"网络不通")
        let 手机号 :Int! = 1313131313
        print(手机号)
        let 人 :Bool? = false
        if let 小鹏 = 人 {
        print(小鹏)
        }else{
        print("用户没有性别")
        }
        let 地址 : String! = "上海"
        if let 小红 = 地址 ,小鹏 = 人{
        print(小红,小鹏)
        }
        if let 小红 = 地址 ,小鹏 = 人 where !小鹏 && 小红 == "上海"{
        print("\(小红)的\(小鹏)包邮")
        }else{
        print("用户性别和地址不完善")
        }
        var sex:Bool?
        sex = true
        if sex == nil{
        print("没有选择性别")
        }else{
        print("用户选择了性别")
        }
        if sex == true{
        print("男性")
        }else{
        print("女性")
        }
        var address:String?
        address = "浙江"
        print(address)
        var age:String
        age = ""
        print(age)
        let 开关是否打开:布尔值
        开关是否打开 = true
        if 开关是否打开{
        
        }
        var (a,b,c) = (3,4,5)
        (a,b,c) = (b,c,a)
        print("\(a)\(b)\(c)")
        let 小明 = (name:"小明",age:16,sexy:"男")
        print("\(小明.name)\(小明.age)\(小明.sexy)")
        print(-Double.infinity)
        print(Double.NaN)
        print(0xFFF)
        print(3.14159e10)
        print(Int(1.804))
        var 二的六十四次方:Int = 2
        for var i = 0;i<31;++i{
          二的六十四次方 = 2*二的六十四次方
        }
        print(二的六十四次方)
        // Do any additional setup after loading the view, typically from a nib.
        /// 创建常量
        let num1 = 42
        let num2 = 43
        let sum=num1+num2
        print(sum)
        
        /// 显式转换  swift只支持显式转换
        let label = "The width is "
        let width = 94
        let widthLabel = label + String(width)
        print(widthLabel)
        
        /// \() 另一种显式转换
        let apples = 3
        let oranges = 5
        let appleSummary = "I have \(apples) apples."
        let fruitSummary = "I have \(oranges + apples) pieces of fruit"
        print(appleSummary)
        print(fruitSummary)
        
        /// 数组 字典
        var shoppingList = ["catfish","water","tulips","blue paint"]
        shoppingList[1] = "bottle of water"
        var occupations = [
            "Malcolm":"Captain",
            "Kaylee":"Mechanic",
        ]
        occupations["Jayne"] = "Public Relations"
        print(occupations)
        print(shoppingList)
        
        /**
        创建空数组 空字典
        */
        let emptyArray = [String] ()
        let emptyDictionary = [Dictionary<String,Float>]()
        print(emptyArray)
        print(emptyDictionary)
        
        /**
        控制流  for in    if
        */
        let individualScores = [75,43,103,87,12]
        var teamScore = 0
        for score in individualScores{
            if score > 20 {
               teamScore += 3
            }else{
              teamScore += 1
            }
        }
        print(teamScore)
        
        /**
        可选值 ????
        */
        let optionalString: String? = "Hello"
        optionalString == nil
        print(optionalString)
        
        var optionalName: String? = "John Appleseed"
        optionalName = nil
        var greeting = "Hello!"
        if let name = optionalName {
            greeting = "Hello , \(name)"
        }
        print(greeting)
        
        /**
        控制流 switch
        */
        let vegetable = "red pepper"
        switch vegetable {
        case "celery":
            let vegetableComment = "Add some raisins and make ants on a log ."
            print(vegetableComment)
        case "cucumber","watercress":
            let vegetableComment = "That would make a good tea sandwich."
            print(vegetableComment)
        case let x where x.hasSuffix("pepper"):
            let vegetableComment = "Is it a spicy \(x)?"
            print(vegetableComment)
        default:
            let vegetableComment = "Everything tastes good in soup."
            print(vegetableComment)
        }
        
        /**
        遍历字典
        */
        let interestingNumbers = [
           "Prime":[2,3,5,7,11,13],
           "Fibonacci":[1,1,2,3,5,8],
            "Square":[1,4,9,16,25],
        ]
        var maxNumber = 0
        for (kind,numbers) in interestingNumbers{
            print(kind);
            for number in numbers {
                if number > maxNumber {
                   maxNumber = number
                }
            }
        }
        print(maxNumber)
       
        /// while repeat 重复运行
        var n = 2
        while n < 100 {
          n = n*2
        }
        print(n)
        
        var m = 2
        repeat {
          m = m*2
        }while m < 100
        print(m)
        
        for i in 0 ... 3{
        print(i)
        }
        
        for var i = 0; i < 3 ; ++i{
         print(i)
        }
        
        /**
        函数和闭包
        */
        let t = greet("Jack", day: "周一", food: "面条")
        print(t.hasPrefix("Hello"))
        print(sumOf(1,2,3,4))
        print(getGasPrices())
        print(average(10,3,5,8,7))
        print(returnFifteen())
        let increment = makeIncrementer()
        print(increment(3))
        print(hasAnyMatches([20,19,7,12],condition:lessThanTen))
        
        /**
        对象和类
        */
        let person = Person.init(name: "呵呵哒")
        person.numberOfSides = 7
        let personDescription = person.simpleDescription()
        print(personDescription)
        
        let personal = Personal(sideLength:3.1 , name:"a triangle")
        personal.perimeter = 9.9
        print(personal.perimeter)
        print(personal.sideLength)
        
        let counter = Counter()
        counter.incrementBy(2, numberOfTimes: 7)
        let  counterT : Counter? = Counter()
        let counterLenth = counterT?.count
        print(counterLenth)
        
        /**
        枚举和结构体
        */
        enum Rank:Int{
            case Ace = 1
            case Two,Three,Four,Five,Six,Seven,Eight,Nine,Ten
            case Jack,Queen,King
            func simpleDescription()->String{
                switch self{
                case .Ace:
                    return "ace"
                case .Jack:
                    return "jack"
                case .Queen:
                    return "queen"
                case .King:
                    return "king"
                default:
                    return String(self.rawValue)
                }
            }
        }
        let ace = Rank.Ace
        let aceRawValue = ace.rawValue
        print(aceRawValue)
        
        enum Suit {
        case Spades, Hearts, Diamonds, Clubs
            func simpleDescription()->String{
                switch self {
                case .Spades:
                    return "spades"
                case .Hearts:
                    return "hearts"
                case .Diamonds:
                    return "diamonds"
                case .Clubs:
                    return "clubs"
                }
            }
        }
        
        /**
        结构体
        */
        struct Card{
            var rank:Rank
            var suit:Suit
            func simpleDescription()->String{
            return "The \(rank.simpleDescription())of\(suit.simpleDescription())"
            }
        }
        
        let card = Card(rank: .Three, suit: .Spades)
        print(card.simpleDescription())
        
        enum ServerResponse{
            case Result(String,String)
            case Error(String)
        }
        let success = ServerResponse.Result("6:00 am", "8:09 pm")
        let failure = ServerResponse.Error("Out of cheese")
        switch success{
        case let .Result(sunrise,sunset):
            let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)"
        case let .Error(error):
            let serverResponse = "Failure... \(error)"
        }
 
}
    func greet(name:String,day:String,food:String)->String{
       return "Hello \(name),today is \(day),eat \(food)"
    }
    func sumOf(numbers:Int...)->Int{
        var sum = 0
        for number in numbers {
          sum += number
        }
        return sum
    }
    func getGasPrices()->(Double,Double,Double){
        return (0.39,0.5,0.3)
    }
    func average(numbers:Int...)->Float{
        var sum:Float=0
        for a in numbers{
        sum += Float(a)
        }
        return sum/Float(numbers.count)
    }
    func returnFifteen()->Int{
        var y:Int=0
        func add(){
        y += 5
        }
        add()
        return y
    }
    func makeIncrementer()->(Int -> Int){
        func addOne(number:Int) -> Int{
           return 1+number
        }
    return addOne
    }
    func hasAnyMatches(list:[Int],condition:Int->Bool)->Bool{
        for item in list{
            if condition(item){
               return true
            }
        }
        return false
    }
    func lessThanTen(number:Int)->Bool{
       return number<10
    }
    
    class Person{
        var numberOfSides = 0
        let numberOne = 3
        var name:String
        init(name:String){
        self.name=name
        }
        func simpleDescription()->String{
            return "A shape with \(numberOfSides) sides"
        }
        func t (num:Int)->String{
            return "Num is \(num)"
        }
     
    }
    class Personal: Person {
        var sideLength:Double = 0.0
        init(sideLength:Double,name:String){
            super.init(name: name)
            self.sideLength = sideLength
            numberOfSides = 3
        }
        var perimeter:Double{
            get{
            return 3*sideLength
            }
            set{
            sideLength = newValue/3.0
            }
        }
        override func simpleDescription() -> String {
            return "An equilateral triagle with sides of length \(sideLength)."
        }
    }
    class Xiaoming {
        var triangel:Personal{
            willSet{
            
            }
        }
        var square:Personal{
            willSet{
            triangel.sideLength = newValue.sideLength
            }
        }
        init(size:Double,name:String){
           square = Personal(sideLength:size,name:name)
           triangel = Personal(sideLength:size,name:name)
        }
    }
    
    class Counter {
        var count:Int = 0
        func incrementBy(amount:Int,numberOfTimes times:Int){
        count += amount * times
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

