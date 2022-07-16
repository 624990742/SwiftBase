import UIKit
import Foundation

///Mark -  KVC 在swift中的使用
/**
 错误写法
 class SimpleClass {
     var someValue: String = "123"
 }
 SimpleClass().setValue("456", forKey: "someValue") // 错误, 必须要继承自 NSObject
 
 正确写法
 class KVCTestClass:NSObject{
    @objc  var someValue: String = "你好"
 }
 let kvc = KVCTestClass()
 print("赋值前边:\(kvc.someValue)")
 kvc.setValue("我很好", forKey: "someValue")
 kvc.someValue = "码农晨仔"
 print("赋值后:\(kvc.someValue)")
 */

/**
KVC 中使用keyPath
class JCPerson : NSObject {
@objc var name:String = ""
init(dict:[String:Any]){
super.init()
setValuesForKeys(dict)
}
}
let person = JCPerson(dict: ["name":"码农晨仔"])
let name = person.value(forKeyPath: #keyPath(JCPerson.name))
print(name ?? "错误")
person.setValue("屌丝夜魅", forKeyPath: #keyPath(JCPerson.name))
print(person.name)
*/

///Mark -  KVO 在swift中的使用

/**
 用法一：
 个人感觉与oc的写法很类似只不过是有一些关键字
 
 
 class KVOClass:NSObject {
    @objc dynamic var currentValue: String = "我可以被监听"
                  var otherValue: String = "我不能被监听"
 }

 class ObserverClass: NSObject {
     
     override init() {
         super.init()
          print("ObserverClass init")
         self.observer()
     }
     
     let kvo = KVOClass()
     func observer() {
         
         kvo.addObserver(self, forKeyPath: "currentValue", options: .new, context: nil)
         kvo.addObserver(self, forKeyPath: "otherValue", options: .new, context: nil)
         kvo.currentValue = "码农晨仔1"
         kvo.otherValue = "码农晨仔2"
        
     }
     
     
     override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
         print("\(keyPath!) change to \(change![.newKey] as! String)")
     }
     
     deinit {
          print("ObserverClass dealloc")
         kvo.removeObserver(self, forKeyPath: "currentValue")
         kvo.removeObserver(self, forKeyPath: "otherValue")
     }
 }
  ObserverClass()

 
 */

/**
 方法二:
 class KVOTestClass: NSObject {
     @objc dynamic var name: String?
     var ob: NSKeyValueObservation?
     override init() {
         super.init()
         name = "你好"
         ob = self.observe(\KVOTestClass.name, options: [.new, .old]) { (_, change) in
             print(change)
         }
         print("KVOTestClass init")
     }
     deinit {
         print("KVOTestClass dealloc")
     }
 }

 var kvoTestObj: KVOTestClass? = KVOTestClass()
 kvoTestObj?.name = "码农晨仔"
 kvoTestObj = nil
 */

/**
 https://zh.wikipedia.org/wiki/%E8%A1%8C%E7%82%BA%E5%9E%8B%E6%A8%A1%E5%BC%8F
 行为型模式
 在软件工程中，行为型模式为设计模式的一种类型，用来识别对象之间的常用交流模式并加以实现。
 如此，可在进行这些交流活动时增强弹性。
 */
/**
 1.责任链（Chain Of Responsibility）
 面向对象程式设计里是一种软件设计模式，它包含了一些命令对象和一系列的处理对象。
 每一个处理对象决定它能处理哪些命令对象，它也知道如何将它不能处理的命令对象传递给该链中的下一个处理对象。
 */

protocol AnimalteEate {
    func eatFoot(amount: Int) -> Bool
}

final class DogAnimalte: AnimalteEate {
    let value: Int
    var quantity: Int
    var next: AnimalteEate?
    init(value: Int,quantity: Int, next: AnimalteEate?){
        self.value = value
        self.quantity = quantity
        self.next = next
    }
    
   
    func eatFoot(amount: Int) -> Bool {

        var amount = amount
        
        func canTakeSomeBill(want: Int) -> Bool {
            return (want / self.value) > 0
        }

        var quantity = self.quantity

        while canTakeSomeBill(want: amount) {

            if quantity == 0 {
                break
            }

            amount -= self.value
            quantity -= 1
        }

        guard amount > 0 else {
            return true
        }

        if let next = self.next {
            return next.eatFoot(amount: amount)
        }

        return false
    }
}

final class TigerAnimalte: AnimalteEate {
    private var hundred: AnimalteEate
    private var fifty: AnimalteEate
    private var twenty: AnimalteEate
    private var ten: AnimalteEate

    private var startPile: AnimalteEate {
        return self.hundred
    }

    init(hundred: AnimalteEate,
           fifty: AnimalteEate,
          twenty: AnimalteEate,
             ten: AnimalteEate) {

        self.hundred = hundred
        self.fifty = fifty
        self.twenty = twenty
        self.ten = ten
    }

    func eatFoot(amount: Int) -> Bool {
        return startPile.eatFoot(amount: amount)
    }
}

// 创建一系列的钱堆，并将其链接起来：10<20<50<100
let ten = DogAnimalte(value: 10, quantity: 6, next: nil)
let twenty = DogAnimalte(value: 20, quantity: 2, next: ten)
let fifty = DogAnimalte(value: 50, quantity: 2, next: twenty)
let hundred = DogAnimalte(value: 100, quantity: 1, next: fifty)

// 创建 ATM 实例
var atm = TigerAnimalte(hundred: hundred, fifty: fifty, twenty: twenty, ten: ten)
atm.eatFoot(amount: 310) // Cannot because ATM has only 300
atm.eatFoot(amount: 100) // Can withdraw - 1x100

