import UIKit
import Foundation

/*
 数组变形->Map
 1.自己写一个数组交换的方法
 var fibs = [1,2,3,4,5,6]
 var squared:[Int] = []
 for fib in fibs {
     squared.append(fib * fib)
 }
 print("squared:\(squared)")
 
  2.swift 提供的map 方法
  var fibs = [1,2,3,4,5,6]
 let squares = fibs.map { fib in
     fib * fib
 }
 print("squares:\(squares)")
 
 3. 与上边的写法相同
 var fibs = [1,2,3,4,5,6]
 let squares = fibs.map { (fib) -> Int in
     fib * fib
 }
  print("squares:\(squares)")

 
 */

/*
 Element  数组包含的元素类型的占位符
  T   元素转换之后类型的占位符
 以上两者可以是任意类型。
 T的具体类型将由调用者传入给 map 的 transform方法的返回值类型决定
 
 extension Array {
     func map<T>(_ transform: (Element) throws -> T) rethrows -> [T] {
         var result:[T] = []
         result.reserveCapacity(count)
         for x in self {
             result.append(try transform(x))
         }
         return result
     }
     
 }

 */

/*
 //基础版本
let names = ["Paula","Elena","Zoe"]
var lastNameEndingInA:String?
for name in names.reversed() where name.hasSuffix("a") {
    lastNameEndingInA = name
    break
}

print("lastNameEndingInA:\(String(describing: lastNameEndingInA))")

//进化版本
 let names = ["Paula","Elena","Zoe"]
 extension Sequence {
   func last(where predicate: (Element) -> Bool) -> Element? {
    for element in reversed() where predicate(element) { return element
 }
   return nil
   }
 }

 let match = names.last {$0.hasSuffix("a")}
 print("match:\(String(describing: match))")

 */



//extension Array {
//func accumulate<Result>(_ initialResult: Result,
//_ nextPartialResult: (Result, Element) -> Result) -> [Result] {
//    var running = initialResult
//     return map { next in
//     running = nextPartialResult(running, next)
//    return running
//    }
//  }
//}
//
//print([1,2,3,4].accumulate(0, +))// [1, 3, 6, 10]

//let nums = [1,2,3,4,5,6,7,8,9,10]
//print(nums.filter{ num in num % 2 == 0})
//nums.filter{$0 % 2 == 0}
//let fibs = [0, 1, 1, 2, 3, 5]
//var total = 0
//for num in fibs {
//    total = total + num
//}
//print("total:\(total)",total)

//let suits = ["♠", "♥", "♣", "♦"]
//let ranks = ["J","Q","K","A"]
//let result = suits.flatMap { suit in
//ranks.map { rank in (suit, rank)
//} }

//let slice = fibs[1...]
//slice // [1, 1, 2, 3, 5]
//type(of: slice) // ArraySlice<Int>

//enum Setting {
//    case text(String)
//    case int(Int)
//    case bool(Bool)
//}
//
//let defaultSettings:[String:Setting] = [
//    "Airplane Model":.bool(false),
//    "Name":.text("My iPhone"),
//]
//print(defaultSettings["Name"]!)



//func swapTwoValues<T>(_ a: inout T,_ b: inout T) {
//    let temporaryA = a
//    a = b
//    b = temporaryA
//}
//
//var someInt = 3
//var anotherInt = 107
//swapTwoValues(&someInt, &anotherInt)


// swift  数组的使用

/*
 1、迭代数组
 
 let  testArr = [3,4,5,6]
 for ob in testArr {
     print(ob)
 }
 */

//print("===1===")
/*
 2.迭代数组中除了第一个元素以外的数组其余部分
 for ob1 in testArr.dropFirst() {
     print(ob1)
 }
 print("===2===")
 */

/*
 3.想要迭代除了个2元素以外的元素，就是从下标为1之后的元素开始。
 for ob2 in testArr.dropLast(2) {
     print(ob2)
 }
 print("===3===")
 */


/*
 4.列举数组中的元素和对应的下标
 
 for (num,element) in testArr.enumerated() {
     print("num==>\(num),element==>\(element)")
 }
 print("========")
 */


/*
 5.寻找一个指定元素的位置
 if let idx = testArr.firstIndex(where:{ (obj)-> Bool in
     if obj == 4 {
     
         return true
     }
     return false
 }) {
     print("\(idx)")
 }

 */

/*
 6.对数组中的所有元素进行变形
 let  resultArr = testArr.map{$0 + 2}
 print("resultArr==>\(resultArr)")
 */


//var testArr = [1,2,3,4]
////在array中过滤出偶数
//let endResult = testArr.filter{
//  $0 % 2 == 0
//}
//print(endResult)
//


/*
 7.数组操作
 var squared:[Int] = []
 var fibs = [1,2,3,4]
 for fib in fibs {
     squared.append(fib*fib)
 }
 print(squared)

 */



/*
 8.使用map方法进行操作
 let squraed1 = fibs.map{fib in fib*fib}
 print("========")
 print(squraed1)

 
 */

/*
 9.
 Element 数组中包含元素的占位符
 T 是元素转换之后类型的占位符。
 map 函数本身并不关心 Element 和 T是什么，他们可以是任意类型。
 T的具体类型将由调用者传入给map的transform方法的返回值类型来决定。
 
 extension Array {
     func map<T>(_transform:(Element)->T) -> [T] {
         var result:[T] = []
         result.reserveCapacity(count)
         for x in self {
             result.append(_transform(x))
         }
         return result
     }
 }


 */


/*
 10.
 
 */

//func map<T>(_ transform:(Element)throws -> T) rethrows ->[T]


//let names = ["Paula","Elena","Zoe"]

//var lastNameEndingInA:String?
//for name in names.reversed() where name.hasSuffix("a") {
//    lastNameEndingInA = name
//    break
//}
//print(lastNameEndingInA ?? "")
//
//
//extension Sequence {
//    func last(where predicate:(Element) ->Bool) -> Element? {
//        for element in reversed() where predicate(element) {
//            return element
//        }
//        return nil
//    }
//}

//let match = names.last{$0.hasSuffix("a")}
//print("match==>\(match ?? "aaa")")



//let name: String? = "老王"
//let age: Int? = 10
//
//if name != nil && age ?? 0 > 0 {
//    print(name! + age!.description)
//}
//
//print("=====1======")
//
//if let nameNew = name,
//    let ageNew = age{
//    print(nameNew,ageNew.description)
//}
//
//
//print("======2=====")
//func demo(name:String?, age: Int?){
//    guard let nameNew1 = name,
//        let ageNew1 = age else {
//        print("guard let")
//        return
//    }
//    print(nameNew1 + String(ageNew1))
//}

//var names = ["Paula","Elena","Zoe"]
//names.map { item in
//    names.insert("aa", at: 1)
//}
//
//extension Array {
//    func accumulate<Result>(_ initialResult: Result,_ nextPartialResult:(Result,Element) ->Result) -> [Result] {
//        var running = initialResult
//        return map { next  in
//            running = nextPartialResult(running,next)
//            return running
//        }
//    }
//}
//
//
//let ttArr = [1,2,3,4].accumulate(0, +)
//print(ttArr)


//let nums = [1,2,3,4,5,6,7,8,9,10]
//nums.filter { num in num % 2 == 0
//    print("num===>\(num)")
//}
//
//nums.filter{$0 % 2 == 0}

//let fibs = [1,2,3,4,5,6]
//let sum = fibs.reduce(0){total,num in total + num}
//print("sum===>\(sum)")
//
//
//extension Array {
//    func map2<T>(_ transform:(Element) -> T) -> [T] {
//        return reduce([]){
//            $0 + [transform($01)]
//        }
//    }
//}


//let suits = ["♠︎", "♥︎", "♣︎", "♦︎"]
//let ranks = ["J","Q","K","A"]
//
//let result = suits.flatMap { suits in
//    ranks.map { rank in
//        (suits,rank)
//    }
//}
//
//
//print(result)
//
//enum Setting {
//    case text(String)
//    case age(Int)
//    case bool(Bool)
//}
//
//let defaultSettings: [String:Setting] = [
//    "Airplane Mode":.bool(false),
//    "Name":.text("My iphone"),
//    "ageNum":.age(10)
//]
//

/**
 var userSettings = defaultSettings
 作用是把不可变的 ”defaultSettings“  复制一份并且命名为 ”userSettings“
 */
//var userSettings = defaultSettings
//userSettings["Name"] = .text("码农晨仔")
//userSettings["Airplane Mode"] = .bool(true)
//
//
//print(userSettings.values)
//print("==========")
//
//let oldName = userSettings.updateValue(.text("小晨晨"), forKey: "name")
//print(userSettings["Name"] ?? "")//输出 ”小晨晨“
//
//let tempAge = userSettings.updateValue(.age(20), forKey: "ageNum")
//print(userSettings["ageNum"] ?? 0)//输出 ”小晨晨“
//
//
//var settings = defaultSettings
//let overriddenSettings:[String:Setting] = ["Name":.text("jiachenzailianxi")]
//settings.merge(overriddenSettings, uniquingKeysWith: {$1})
//print("setting==>\(settings)")
//
//
//extension Sequence where Element:Hashable {
//    var frequencies:[Element:Int] {
//        let frequencyPairs = self.map{($0,1)}
//        print("frequencyPairs==>\(frequencyPairs)")
//        return Dictionary(frequencyPairs,uniquingKeysWith:+)
//    }
//}
//
//let frequencies = "hello".frequencies
//print("frequencies + \(frequencies)")
//
//print("==========")
//
//frequencies.filter{$0.value > 1}
//print("frequencies + \(frequencies.filter{$0.value > 1})")
//
//
//
//
//let settingAsStrings = settings.mapValues { setting -> String in
//    switch setting {
//    case .text(let text): return text
//    case .age(let number): return String(number)
//    case .bool(let value): return String(value)
//    }
//}
//print("settingsAsStrings ==> \(settingAsStrings)")

/**

 ExpressibleByArrayLiteral 协议
 
 let naturals: Set = [1,2,3,2]
 print("naturals==>\(naturals)")
 print("naturals.contains(3)==>\(naturals.contains(3))")
 naturals.contains(0)
 print("naturals.contains(0)==>\(naturals.contains(0))")

 */


//补集
/*
 let employees: Set = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
 let neighbors: Set = ["Bethany", "Eric", "Forlani", "Greta"]
let nonNeighbors = employees.subtracting(neighbors)
   print("nonNeighbors==>\(nonNeighbors)")
   print("===========")
 let nonEmployees = neighbors.subtracting(employees)
 print("nonEmployees==>\(nonEmployees)")
 */
 



/**
 交集
 let iPods: Set = ["iPod touch", "iPod nano", "iPod mini",
 "iPod shuffle", "iPod Classic"]
 let touchscreen: Set = ["iPhone", "iPad", "iPod touch", "iPod nano"]
 let iPodsWithTouch = iPods.intersection(touchscreen)
 print("iPodsWithTouch==>\(iPodsWithTouch)")
 */

/**
 并集
 let discontinuedIPods: Set = ["iPod mini", "iPod Classic",
 "iPod nano", "1"]
 var discontinued:Set = ["iBook","Powerbook","Power Mac","1"]
 discontinued.formUnion(discontinuedIPods)
 //SetAlgebra 协议。
 print("discontinued==>\(discontinued)")
 */

//var indices  = IndexSet()
//indices.insert(integersIn:1..<5)
//indices.insert(integersIn: 11..<15)
//let  evenIndices = indices.filter{$0 % 2 == 0}
//
//extension Sequence where Element: Hashable {
//    func unique() -> [Element] {
//        var seen:Set<Element> = []
//        return filter { element in
//            if seen.contains(element) {
//                return false
//            } else {
//                seen.insert(element)
//                return true
//        }
//    }
//  }
//}
//print([1,2,3,12,1,3,4,5,6,4,6].unique())

/*
//闭合范围
let  singleDigitNumbers = 0..<10
Array(singleDigitNumbers)
let  lowercaseLetters = Character("a")...Character("z")
print("lowercaseLetters==>\(lowercaseLetters)")

//单边范围
let  fromZero = 0...
let upToZ = ..<Character("z")

/**
 Range  ..< 创建的半开范围
 ClosedRange ... 闭合范围
 */
let result1 = singleDigitNumbers.contains(9)
let result2  = lowercaseLetters.overlaps("c"..<"f")

print("result1:\(result1),result2:\(result2)")
*/
/**
 数组切片练习
 
 extension Array {
     subscript(input: [Int]) -> ArraySlice<Element>{
         
         get {
             var result = ArraySlice<Element>()
             for i in input {
                 assert(i < self.count, "Index out of range")
                 result.append(self[i])
             }
             return result
         }
         
         set {
             
             for (index,i) in input.enumerated() {
                 assert(i < self.count,"Index out of range")
                 self[i] = newValue[index]
             }
         }
         
     }
 }

  var arr = [1,2,3,4,5]
 arr[[0,2,3]]
 print(arr)
 arr[[0,2,3]] = [-1,-3,-4]
 print(arr)
 
 */

/**
 typealias 为已经存在的类型重新定义名字
 
 func distance(from point: CGPoint,to anothrtPoint: CGPoint) -> Double {
     let dx = Double(anothrtPoint.x - point.x)
     let dy = Double(anothrtPoint.y - point.y)
     return sqrt(dx * dx + dy * dy)
 }
 let origin: CGPoint = CGPoint(x: 0,y: 0)
 let point: CGPoint = CGPoint(x: 1,y: 1)
 let d: Double = distance(from: origin, to: point)


 //下边是使用了 typealias重新命名的


 typealias Location = CGPoint
 typealias Distance = Double

 func distance1(from location: Location,to anotherLocation: Location) -> Distance {
     let dx = Distance(anotherLocation.x - location.x)
     let dy = Distance(anotherLocation.y - location.y)
     return sqrt(dx * dx + dy * dy)
 }

 let oringin1 : Location = Location(x: 0,y: 0)
 let point1: Location = Location(x: 1, y: 1)
 let d1: Distance = distance1(from: oringin1, to: point1)
 protocol Cat{}
 protocol Dog{}
 typealias Pat = Cat & Dog


 protocol Food {}
 protocol Animal {
     func eat(_ food: Food)
 }
 struct Meat: Food { }
 struct Grass: Food { }

 struct Tigger: Animal {
     func eat(_ food: Food){
         if let meat = food as? Meat {
             print("eat\(meat)")
         } else {
             fatalError("Tiger can only eat meat!")
         }
     }
 }

 let meat = Meat()
 Tigger().eat(meat)

 
 class ClassA {
     let numA: Int
     init(num: Int) {
      numA = num
     }
 }

 class ClassB: ClassA {
     let numB : Int

    override init(num: Int) {
         numB = num + 1
     super.init(num: num)
     }
 }


 class TestObjc {
     let tempStr: String
     init(str: String) {
         tempStr = str
     }
 }

 let testObj = TestObjc.init(str: "你好")
 print(testObj.tempStr)
 */
/**
 给 Int 添加 extension 重新定义 init 为 init? 能在适当的时候返回nil
 可以保证安全不会崩溃。
 extension Int {
     init?(temString: String){
     self = 0
     var digit = temString.count - 1
         for c in temString {
             var number = 0
             if let n = Int(String(c)) {
                 number = n
             } else {
                 
                 switch c {
                                 case "一": number = 1
                                 case "二": number = 2
                                 case "三": number = 3
                                 case "四": number = 4
                                 case "五": number = 5
                                 case "六": number = 6
                                 case "七": number = 7
                                 case "八": number = 8
                                 case "九": number = 9
                                 case "零": number = 0
                                 default: return nil

                 }
                 
             }
             self = self + number * Int(pow(10, Double(digit)))
             digit = digit - 1
         }
     }
 }

 let number1 = Int(temString: "12")
 print(number1!)

 let number2 = Int(temString: "三二五")
 print(number2!)

 let number3 = Int(temString: "七9八")
 print(number3!)

 let number4 = Int(temString: "吃了么")
 print(number4 as Any)

 */

/**
 swift
 func getTestValue(vid: String, completion:(@escaping(String) ->Void)) {
     
     if vid.isEmpty == false {
         completion("测试")
         return
     }
     print("还会执行吗？")
 }

 getTestValue(vid: "你好") { (str) in
     print(str)
 }
 */


/**
 正则的使用
 struct RegexHelper {
     let regex: NSRegularExpression

     init(_ pattern: String) throws {
         try regex = NSRegularExpression(pattern: pattern,
             options: .caseInsensitive)
              }

             func match(_ input: String) -> Bool {
                 let matches = regex.matches(in: input,
                             options: [],
                             range: NSMakeRange(0, input.utf16.count))
                 return matches.count > 0
             }
         }
 let mailPattern = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"

 let matcher: RegexHelper
 do {
   matcher = try RegexHelper(mailPattern)
 }

 let maybeMailAddress = "ttt.iyl"

 if matcher.match(maybeMailAddress) {
     print("有效的邮箱地址")
 }
 
 //类型重载
 precedencegroup MatchPrecedence {
     associativity: none
     higherThan: DefaultPrecedence
 }

 infix operator =~: MatchPrecedence
 func =~(lhs:String, rhs:String) -> Bool  {
     do {
         
         return try RegexHelper(rhs).match(lhs)
     } catch _ {
         return false
     }
     
 }


 if "onev@onevcat.com" =~
     "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$" {
         print("有效的邮箱地址")
 }

 */
/**
 AnyClass  元类类型的使用
 
 class  A {
     class func method() {
         print("Hello")
     }
 }

 let classA :AnyClass = A.self
 (classA as! A.Type).method()


 let typeA : A.Type = A.self

 typeA.method()


 class TestControllerA: UIViewController {
     
 }

 class TestControllerB: UIViewController {
     
 }

 let vcTestlss: [AnyClass] = [TestControllerA.self, TestControllerB.self]

 func setupVC(_ vcTypes: [AnyClass]){
     for vcType in vcTypes {
         if vcType is UIViewController.Type {
             let vc = (vcType as! UIViewController.Type).init()
             print("vc::\(vc)")
         }
     }
 }

 setupVC(vcTestlss)

 */

/**
 
 .Self的使用方法
 
 
 protocol  Copyable {
     func copy() -> Self
 }

 class MyClass: Copyable {
     var num = 1
 //    func copy() -> Self {
 //        let result = MyClass()
 //        result.num = num
 //        return result as! Self
 //    }
     
     func copy() -> Self {
         let result = type(of: self).init()
         result.num = num
         return result
     }
  
     required init(){
         
     }
 }

 let obhect = MyClass()
 obhect.num = 100

 let newObject = obhect.copy()
 obhect.num = 1

 print(obhect.num)
 print(newObject.num)

 */


/**
 类可以多重继承
 
 class Pet {}
 class Cat: Pet {}
 class Dog: Pet {}

 func printPet(_ pet: Pet) {
     print("Pet")
 }

 func printPet(_ cat: Cat) {
     print("Meow")
 }

 func printPet(_ dog: Dog) {
     print("Bark")
 }
 printPet(Cat()) // Meow
 printPet(Dog()) // Bark
 printPet(Pet()) // Pet”
 */


/**
 lazy 的使用
 
 
 
 let data = 1...3
 let result = data.lazy.map {
     (i: Int) -> Int in
     print("正在处理 \(i)")
     return i * 2
 }


 print("准备访问结果")
 for i in result {
     print("操作后结果为 \(i)")
 }

 print("操作完毕")
 
 
 
 没有使用lazy的操作
 let data = 1...3
 let result = data.map {
     (i: Int) -> Int in
     print("正在处理 \(i)")
     return i * 2
 }

 print("准备访问结果")
 for i in result {
     print("操作后结果为 \(i)")
 }

 print("操作完毕")


 */


/**

 //
 //struct Person {
 //    var name: String
 //    var age: Int
 //}
 //var xiaoMing = Person(name: "xiaoMing", age: 16)
 //let r = Mirror(reflecting: xiaoMing)
 //print("xiaoMing 是 \(r.displayStyle!)")
 //print("xiaoMing 父亲是\(r.subjectType)")
 //print("xiaoMing superclassMirror是\(String(describing: r.superclassMirror))")
 //
 //print("属性个数:\(r.children.count)")
 //for child in r.children {
 //    print("属性名:\(String(describing: child.label))，值:\(child.value)")
 //}
 //print("============")
 //dump(xiaoMing)

 //
 //func valueToKey(_ object: Any,key: String) -> Any? {
 //    let mirror = Mirror(reflecting: object)
 //    for child in mirror.children {
 //
 //        let(targetKey,targetMirror) = (child.label,child.value)
 //        if key == targetKey {
 //            return targetMirror
 //        }
 //    }
 //    return nil
 //}
 //
 //
 //func setValueToKey(_ object: Person,Key: String,newValue: String){
 //
 //    let mirror = Mirror(reflecting: object)
 //    for child in mirror.children {
 //        if Key == child.label {
 //            object.name = newValue
 //        }
 //    }
 //
 //}
 //
 //setValueToKey(xiaoMing, Key: "name", newValue: "码农晨仔")
 //
 //dump(xiaoMing)

 //
 //if let name = valueToKey(xiaoMing, key: "name") as? String {
 //    print("通过key得到值:\(name)")
 //}


 var aNil: String? = nil

 var anotherNil: String?? = aNil
 var literalNil: String?? = nil
 if anotherNil != nil {
     print("anotherNil")
 }

 if literalNil != nil {
     print("literalNil")
 }
 
 
 
 
 protocol A1 {
     func method1() -> String
 }

 struct B1: A1 {
     func method1() -> String {
         return "hello"
     }
 }
 let b1 = B1() // b1 is B1
 b1.method1()
 // hello

 let a1: A1 = B1()
 // a1 is A1
 a1.method1()
 // hello

 protocol A2 {
     func method1() -> String
 }

 extension A2 {
     func method1() -> String {
         return "hi"
     }

     func method2() -> String {
         return "hi"
     }
 }



 struct B2: A2 {
     func method1() -> String {
         return "method1"
     }

     func method2() -> String {
         return "method2"
     }
 }
 let b2 = B2()

 b2.method1() // hello
 b2.method2() // hello”

 let a2 = b2 as A2

 a2.method1() // hello
 a2.method2() // hi
 
 
 let sortableArray: [Int] = [3,1,2,4,5]
 let unsortableArray: [Any?] = ["Hello", 4, nil]
 let testArr1 = sortableArray.sorted()
 print("testArr1==>\(testArr1)")

 let testArr2 = unsortableArray.sorted()
 print("testArr2==>\(testArr2)")

 //单例写法一
 class MyManager {
     class var shared : MyManager {
         struct Static {
             static let sharedInstance : MyManager = MyManager()
         }

         return Static.sharedInstance
     }
 }

 
 //单例写法二
 private let sharedInstance = MyManager()
 class MyManager  {
     class var shared : MyManager {
         return sharedInstance
     }
 }
 */


//单例写法三
//class MyManager  {
//    static let shared = MyManager()
//    private init() {}
//}
//
//for i in 0...10 {
//    DispatchQueue.global().async {
//        print("前==>\(i)")
//    }
//}
//DispatchQueue.global().async(flags: .barrier) {
//    print("this is barrier")
//}
//for i in 11...20 {
//    DispatchQueue.global().async {
//        print("后==>\(i)")
//    }
//}

//
//class testTextView: UITextView {
//
//    var placeHolderStr = "请输入" {
//        didSet{
//            holderView.text = placeHolderStr
//        }
//    }
//
//
//    lazy var holderView: UITextView = {
//        let holder = UITextView(frame: CGRect.zero)
//        holder.isUserInteractionEnabled = false
//        holder.backgroundColor = UIColor.clear
//        holder.text = "这里是占位符"
//        holder.textColor = UIColor.lightGray
//        holder.isEditable = false
//        holder.isHidden = self.hasText
//        return holder
//    }()
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        setupLab()
//    }
//    override init(frame: CGRect, textContainer: NSTextContainer?) {
//        super.init(frame: frame, textContainer: textContainer)
//        setupLab()
//    }
//    func setupLab() -> Void {
//        addSubview(holderView)
//        NotificationCenter.default.addObserver(self, selector: #selector(textHaveChangeText), name: UITextView.textDidChangeNotification, object: nil)
//    }
//
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        holderView.frame = bounds
//    }
//
//    override var text: String! {
//        didSet{
//            holderView.isHidden = self.hasText
//        }
//    }
//
//    /// 改变文字了
//    @objc func textHaveChangeText() ->Void {
//        holderView.isHidden = self.hasText
//    }
//
//    deinit {
//        NotificationCenter.default.removeObserver(self)
//    }
//
//}
//let queue = OperationQueue()
// queue.maxConcurrentOperationCount = 3
//let op1 = BlockOperation {
//
//    print("任务1---\(Thread.current)")
//}
//
//let op2 = BlockOperation {
//
//    print("任务2---\(Thread.current)")
//}
//
//let op3 = BlockOperation {
//
//    print("任务3---\(Thread.current)")
//}
//
////op2.addDependency(op1)
////op3.addDependency(op2)
//
//
//queue.addOperation(op1)
//queue.addOperation(op2)
//queue.addOperation(op3)

////原始字符串
//let str1 = "   欢迎访问 hangge.com   "
////除去前后空格
//let str2 = str1.trimmingCharacters(in: .whitespaces)
//
//print(str1)
//print("=======")
//print(str2)


let fibs = [0,1,1,2,3,5]
var total = 0
//for num in fibs {
//    total = total + num
//}
//print("total==>\(total)")

//
//let sum = fibs.reduce(0) { total, num in
//    total + num
//}
let tt = fibs.reduce(0,+)
print("total==>\(tt)")






