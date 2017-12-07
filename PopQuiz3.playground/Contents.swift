//: Playground - noun: a place where people can play

import UIKit

/* How can two objects communicate with each other? */

    //using segue or nsnotification

/*:
 Create a protocol called `Vehicle` with two requirements: a nonsettable `numberOfWheels` property of type `Int`, and a function called `drive()`.
 */




protocol Vehicle {
    var numberOfWheels: Int { get }
    func drive()
}


/*:
 Define a `Car` struct that implements the `Vehicle` protocol. `numberOfWheels` should return a value of 4, and `drive()` should print "Vroom, vroom!" Create an instance of `Car`, print its number of wheels, then call `drive()`.
 */


struct Car :Vehicle {
    var  numberOfWheels: Int {
        return 4 }
    func drive(){
        print ("Vroom, vroom!")
    }
}





/* Describe the MVC design pattern and how it's used */

        //model view controller, 3 differents layers,in model we define the classes of type pesistance, in conntroller class with action function (often static) and the view is the main.storyboard

/* Describe the Singleton and how it's used */

        // the singleton is a class with a type of himself static inside, every time we call him it chek if it still exist, then if not exist, it been created, else, we just past the old one to be use

/* Name a few ways to save data */

        //database, file, userDefault

/* Implement the NSCoding protocol on Car */

class myCar :Vehicle, NSCoding {
   
    
    var  numberOfWheels: Int {
        return 4 }
    func drive(){
        print ("Vroom, vroom!")
    }
    
    func encode(with aCoder: NSCoder) {
        <#code#>
    }
    
    required init?(coder aDecoder: NSCoder) {
        <#code#>
    }
}

/* What class does a tableview inherit from? */

  //UITableViewController

/* What are some advantages and disadvantages of using a xib file over a storyboard? */

        // advantage of xib :  we separate the flow of the program from the views, so easier to maintain the code, for change a view, we just create a new view and when is finished, we link it in place of the old one, it's easier to work many peaple together, each one on it view and then just have to link the view on the flow

        //advantage on no xib : easier to work in graphic for little projects


/* What are the advantages and disadvantages of notifications over delegates? */

        //not the same, notification send event and parameter over the application, dont have to be linked to the receiver, the observer will receive and then apply the function we define to be called when the event is sent, the problem is than we have to be carrefull about the flow because the function can be called befor the normal way of creating objects and attributs, then you can try to use an object who still have not be created

        //delegate is using alternative function, when a func is called, the work is made by another one, then we don't have to redefine the work and you can give services to the developper without give him access to your code
