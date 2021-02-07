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

