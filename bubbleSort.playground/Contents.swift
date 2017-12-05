
import UIKit

func bubble(_ myArray : [Int]) -> [Int]{
   
    var arrayToSort = myArray
    /*initialisation d'un bool qui passe a false en entrant dans le while et repasse a true des qu'un changement est effectue dans le array, ainsi, la derniere fois ou il rentre dans le while, si il n'effectue auccun changement dans le array, il reste a false et ne rentrera donc plus dans le while.*/
    var flag = true
    
    while(flag){
        flag = false
        /* on boucle sur le array, le FOR renvoie les elements du array un par un ainsi que l'index */
        for (index, item) in arrayToSort.enumerated() {
            /* on controle que l'index s'arrette a l'avant derniere place car on compare l'emplacement de l'index avec l'emplacement suivant, donc si on passe sur le dernier element du array, il cherchera l'element suivant qui n'existe pas et marquera une erreur */
            if(index < arrayToSort.count-1){
                /*le bubble sort, si element  est plus grand que l'element a place INDEX+1, on swap*/
                if(item > arrayToSort[index+1]){
                    flag = true
                    let temp = arrayToSort[index]
                    arrayToSort[index] = arrayToSort[index+1]
                    arrayToSort[index+1] = temp
                }
            }
        }
    }
    /*fin du while, on renvoie le nouveau array*/
    return arrayToSort
}

var array = bubble([115,5,3,87,7,45,1,9,34])
print (array)

