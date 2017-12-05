
import UIKit

func dichotomique(_ myArray : [Int], _ value : Int) -> Int?{
    
    
    var index = myArray.count / 2
    var indexDown = 0
    var indexHight = myArray.count - 1
    
    while(true) {
        if ( value == myArray[index]  ){
            return index
        }
        else if   (value == myArray[indexHight] ){
            return indexHight
        }
        else if   (value == myArray[indexDown] ){
            return indexDown
        }
        else if   (value < myArray[indexDown] || value > myArray[indexHight] ){
            return nil
        }
        else if(value < myArray[index] && value > myArray[index - 1] || value > myArray[index] && value < myArray[index + 1]  ){
            return nil
        }
        else if (value < myArray[index]){
          
            indexHight = index
            index = (indexHight + indexDown ) / 2
            print ("indexdown : \(indexDown) index : \(index) indexHight : \(indexHight)")
        }
        else if(value > myArray[index]){
           
            indexDown = index
            index = (indexHight + indexDown ) / 2
              print ("indexdown : \(indexDown) index : \(index)  indexHight : \(indexHight)")
        }
    }
}

var index = dichotomique([3,6,8,9,12,15,18,24,45], 45)
print(index!)

