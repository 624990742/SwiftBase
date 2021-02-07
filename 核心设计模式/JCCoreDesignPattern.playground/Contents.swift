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

//class KVOClass:NSObject {
//    dynamic var someValue: String = "123"
//    var someOtherValue: String = "abc"
//}
//
//class ObserverClass: NSObject {
//    func observer() {
//        let kvo = KVOClass()
//        kvo.addObserver(self, forKeyPath: "someValue", options: .new, context: nil)
//        kvo.addObserver(self, forKeyPath: "someOtherValue", options: .new, context: nil)
//        kvo.someValue = "456"
//        kvo.someOtherValue = "def"
//        kvo.removeObserver(self, forKeyPath: "someValue")
//        kvo.removeObserver(self, forKeyPath: "someOtherValue")
//    }
//    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
//        print("\(keyPath!) change to \(change![.newKey] as! String)")
//    }
//}
//ObserverClass().observer()

