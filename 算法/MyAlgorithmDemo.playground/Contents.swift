import UIKit


/// Mark - 冒泡算法
/*
func bubbleSortMethod(_ nums: inout [Int]) {
    var iCount = 0;//记录外层循环的次数
    var jCount = 0;//记录内存循环交换的次数
    let n = nums.count
    for i in 0..<n {
        iCount += 1
        for j in 0..<(n - 1 - i) {
            jCount += 1
            if nums[j] > nums[j + 1] {
                nums.swapAt(j, j + 1)
                print(nums)
                print("============")
            }
        }
    }
    print("外层次数:\(iCount)","交换次数:\(jCount)")
}
 
var nums = [10,1,2,9,7,19,5,3,8,13,17]
bubbleSortMethod(&nums)
*/



/// Mark - 选择排序
/**
 选择排序（Selection sort）是一种简单直观的排序算法。
 
 工作原理是：第一次从待排序的数据元素中选出最小（或最大）的一个元素，存放在序列的起始位置，然后再从剩余的未排序元素中寻找到最小（大）元素，然后放到已排序的序列的末尾。以此类推，直到全部待排序的数据元素的个数为零。选择排序是不稳定的排序方法。
 */

/*
 写法1
func selectionSortMethod(_ nums: inout [Int]){
    let items = nums.count//数组的个数
    var minIndex:Int

    for i in 0..<items-1 {
        minIndex = i
        for j in i+1..<items {
            if nums[j] < nums[minIndex] {
                minIndex = j
            }
        }
        if i != minIndex {
         nums.swapAt(i, minIndex)
        }

        print("中途运算：\(nums)")
        print("===============")
    }
}

var nums = [10,1,2,9,7,19,5,3,8,13,17]
print("前边：\(nums)")
print("===============")
selectionSortMethod(&nums)
print("后边：\(nums)")
 
 写法2：
 func selectionSortMethod(_ nums: [Int]) -> [Int] {
   guard nums.count > 1 else { return nums }//必须大于1才能使用

   var array = nums
   var minIndex: Int
     
   for i in 0 ..< array.count - 1 {
     minIndex = i
     for j in i + 1 ..< array.count {
       if array[j] < array[minIndex] {
         minIndex = j
       }
     }

     if i != minIndex {
         array.swapAt(i, minIndex)
     }
   }
   return array
 }

 let oringeList = [10,1,2,9,-1,7,19,5,-9,3,8,13,17]
 let afterList = selectionSortMethod(oringeList)
 print(oringeList)
 print("======")
 print(afterList)
 
*/

/// Mark - 选择排序


/// Mark - 数据结构与算法之美案例代码
func cal(n: Int) -> Int{
    var sum = 0
    let i = 1
    for i in i...n  {
        sum = sum + i
    }
    return sum
}

print(cal(n: 10))
