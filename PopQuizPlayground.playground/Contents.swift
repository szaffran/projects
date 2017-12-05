//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/* How do you print the string above? */

print(str)

/* Name some basic data types. */

// Int, String, [int], Bool

/* What is the difference between an array and a dictionary? */

print ("an array is a group of value, a dictionary is a group af couple of value value/key ")

/* Create a class for a Person with name, age, height, gender, and race as its properties */

class Person{
    var name : String = ""
    var age : Int = 0
    var height : Int = 0
    var gender : String  = ""
    var race: String  = ""
    
    init(){
        
    }
}


/* Describe and/or code binary search. */

//func binary(array : [Int]) -> [Int]{
//    var myReturnArray = array
//    var pointer = myReturnArray.count/2
//    if()
//
//    for (index,item) in myReturnArray.enumerated(){
//
//    }
//    return myReturnArray
//}

/* Imagine you have two array a = [1,2,3,4,5] and b =[3,2,9,3,7], write a function to find out common elements in both array. */
func removeDoubles(_ array : [Int]) -> [Int]{
    var array = array
    for (index,firstItem )in array.enumerated(){
        if(){
            for secondIndex in index+1...array.count{
                if(firstItem == array[secondIndex]){
                    array.remove(at: secondIndex)
                }
            }
        }
        
    }
    return array
}
func findCommonElement(_ a : [Int],_ b:[Int]) -> [Int]{
   
    removeDoubles(a)
    removeDoubles(b)
    
    var returnArray : [Int] = []
    for aItem in a{
        for bItem in b{
            if (aItem == bItem){
                returnArray.append(aItem)
            }
        }
    }
    return returnArray
}


findCommonElement([1,2,3,4,5],[3,2,9,3,7])


