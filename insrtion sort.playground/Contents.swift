//: Playground - noun: a place where people can play

import UIKit


func insertionSort(paramArray : [Int]) -> [Int]{
    var sortedArray = paramArray
    
    
    for (index,item) in sortedArray.enumerated(){
       
        //the index start a the second place because we check each item with previous items
        if( index > 0 ){
            //second loop from begining of the array until the place of the actual index
            for index2 in 0...index{
                print(sortedArray)
                if(sortedArray[index2]>item){
                    
                    let temp = item
                    for ind in (index2+1...index).reversed(){
                        //print(ind)
                        sortedArray[ind]=sortedArray[ind-1]
                    }
                    sortedArray[index2] = temp
                    break
                }
            }
        }

    }
    return sortedArray
}


//for ind in (1...10).reversed() {
//    print("index: \(ind)")
//}


var array : [Int] = [12,5,7,3,6,2,9]
var sortedArray = insertionSort(paramArray :array)
print(sortedArray)

