import UIKit
import Foundation

//enum PaperSize: String {
//    case A4, A5, Letter, Legal
//}
//let selectedSize = PaperSize.Letter
//    print(selectedSize.rawValue)
//    print(selectedSize == PaperSize(rawValue: selectedSize.rawValue)!)


/**
 1.默认创建是串行队列
 let queque1 = DispatchQueue(label: "jc.test.log1",qos: .default)
 let queque2 = DispatchQueue(label: "jc.test.log2",qos: .utility)
queque1.sync {
     for i in 0..<5 {
     print("来了一+\(i)")
     }
 }
 queque2.sync {
     for i in 5..<10 {
     print("来了二+\(i)")
     }
 }
*/
 

 /**
 异步串行队列
let queque1 = DispatchQueue(label: "jc.test.log1",qos: .default)
let queque2 = DispatchQueue(label: "jc.test.log21",qos: .utility)
queque1.async {
    for i in 0..<5 {
    print("来了一+\(i)")
    }
}
queque2.async {
    for i in 5..<10 {
    print("来了二+\(i)")
    }
}
*/

/**
 并发队列
let queue = DispatchQueue(label: "jc.test.log1", qos: .utility, attributes: .concurrent)

queue.sync  {
    for i in 0..<5 {
       print("来了一+\(i)")
       }
}

queue.sync {
     for i in 5..<10 {
       print("来了二+\(i)")
       }
}

 */

/*
let queue = DispatchQueue(label: "jc.test.log", qos: .utility,
attributes: .initiallyInactive)

queue.async {
    for i in 0..<5 {
       print("来了一+\(i)")
       }
}

queue.async {
     for i in 5..<10 {
       print("来了二+\(i)")
       }
}

//需要调用activate，激活队列。
queue.activate()
*/

/**
 延迟操作
let queue = DispatchQueue(label: "jc.test.log")

let time = DispatchTimeInterval.seconds(3)

queue.asyncAfter(wallDeadline: .now() + time) {
    print("wall dead line done")
}

queue.asyncAfter(deadline: .now() + time) {
    print("dead line done")
}
*/

/**
方法1： 多个网络任务全部执行完毕之后统一进行处理。
let group = DispatchGroup();
let queue1 = DispatchQueue(label: "jc.test.com1", qos: .utility)
let queue2 = DispatchQueue(label: "jc.test.com2", qos: .utility)
let queue3 = DispatchQueue(label: "jc.test.com3", qos: .utility)
group.enter()
queue1.async(group: group){
group.leave()
  print("queue1.async")
}


group.enter()
queue2.async(group: group){
group.leave()
    print("queue2.async")
}


group.enter()
queue3.async(group: group){
group.leave()
    print("queue3.async")
}

group.notify(queue: DispatchQueue.main){
   print("group.notify")
}
*/

/**
2.栅栏任务
 特点:
 */
