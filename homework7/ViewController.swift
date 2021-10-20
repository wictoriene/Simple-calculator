//
//  ViewController.swift
//  homework7
//
//  Created by wictoriene on 17.10.21.
//

import UIKit

class ViewController: UIViewController {
    enum MathSign {
        case ac,multiply,divide,sub,add,equals
    }
    
    let mathSignsMap:[MathSign:Int] = [.ac:10,.divide:13,.multiply:14,.sub:15,.add:16,.equals:17]
    var number: Double = 0
    var previousNumb: Double = 0
    var mathSign: Bool = false
    var operation = 0
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func numbersButton(_ sender: UIButton) {
        if mathSign == true {
            resultLabel.text = String(sender.tag)
            number = Double(resultLabel.text!)!
            mathSign = false
            
        } else {
            let currentText = resultLabel.text!
            resultLabel.text = Double(currentText) == 0 ? String(sender.tag) : currentText + String(sender.tag)
            number = Double(resultLabel.text!)!
        }
        
    }
    
    @IBAction func functions(_ sender: UIButton) {
        if sender.tag != mathSignsMap[.ac] && sender.tag != mathSignsMap[.equals] {
            mathSign = true
            previousNumb = Double(resultLabel.text!)!
        }
        
        switch sender.tag {
        case mathSignsMap[.divide]:
            operation = mathSignsMap[.divide]!
        case mathSignsMap[.multiply] :
            operation = mathSignsMap[.multiply]!
        case mathSignsMap[.sub] :
            operation = mathSignsMap[.sub]!
        case mathSignsMap[.add]:
            operation = mathSignsMap[.add]!
        case mathSignsMap[.equals]:
            resultLabel.text = calculate(operation: operation, previousNumb: previousNumb, number: number)
        case mathSignsMap[.ac]:
            resultLabel.text = "0"
            previousNumb = 0
            number = 0
            operation = 0
        default:
            break
        }
    }
    
    func calculate (operation:Int,previousNumb: Double, number: Double) -> String{
        var result: String = ""
        switch operation {
        case mathSignsMap[.divide]:
            result = String(previousNumb/number)
        case mathSignsMap[.multiply] :
            result = String(previousNumb*number)
        case mathSignsMap[.sub] :
            result = String(previousNumb-number)
        case mathSignsMap[.add]:
            result = String(previousNumb+number)
        default:
            break
        }
        return result
    }
}

