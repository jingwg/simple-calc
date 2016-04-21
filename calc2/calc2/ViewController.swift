//
//  ViewController.swift
//  calc2
//
//  Created by chelseaGJW on 16/4/20.
//  Copyright © 2016年 chelseaGJW. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet var resultString: UILabel!
    
    var result: Int = 0
    var inputNum: Int = 0
    var userEntering = false
    var enteredOp = false
    var operatorButton = String()
    var numArray = [Int]()
    
    @IBAction func numInput(sender: UIButton) {
        let digit = sender.currentTitle!
        if userEntering {
            resultString.text = resultString.text! + digit
            inputNum = Int.init(resultString.text!)!
        }else{
           resultString.text =  digit
            inputNum = Int.init(resultString.text!)!
            userEntering = true
        }
    }
    
    
    // tap numA(get the inputnum) t hen operateion + - * /(stored numA stored the operation) then clear the labe input another new numBthen result(swith to find the stored operation and give the result)
    
    // tap numA(get inputnum) then operation count avg(create array stored numA) then avg + numB in there and  provide result  then numC then result
    
    @IBAction func operation(sender: UIButton) {
        let currentOp = sender.currentTitle!
        
        if(enteredOp == false){
            operatorButton = sender.currentTitle! //two kinds swith operatorButton
            switch currentOp {
            case "+", "-", "/", "*", "%","Fact":
                result = inputNum
                resultString.text = ""
            case "Count", "Average": numArray.append(inputNum)
                                    resultString.text = ""
            default: break
            }
            enteredOp = true

        }else{
            
        switch operatorButton{
            case "+" : result = result + inputNum
            case "-" : result = result - inputNum
            case "/" : result = result/inputNum
            case "*" : result = result * inputNum
            case "%" : result = result % inputNum
            case "Count", "Average" :
                    numArray.append(inputNum)
                    resultString.text = ""
                    if (currentOp == "="){
                        switch operatorButton {
                            case "Count": result = numArray.count
                            case "Average" : for num in numArray {
                                                result = result + num
                                            }
                                            result = result / numArray.count
                            default: break
                        }
                    }
            case "Fact" : result = 1
                for index in 1...inputNum {
                            result = result * index
                        }
            default: break
            }
        }
        
        if (currentOp == "="){
            resultString.text = "\(result)"
        }
    }
}

   /* override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
 */
    




