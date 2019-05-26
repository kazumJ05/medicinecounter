//
//  ViewController.swift
//  medicinecounter
//
//  Created by 大原一倫 on 2017/08/09.
//  Copyright © 2017年 oharakazumasa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var number: Int = 0
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    @IBOutlet var label3: UILabel!
    @IBOutlet var label4: UILabel!
    @IBOutlet var label5: UILabel!
    @IBOutlet var textField1: UITextField!
    @IBOutlet var textField2: UITextField!
    @IBOutlet var textField3: UITextField!
    @IBOutlet var textField4: UITextField!
    @IBOutlet var textField5: UITextField!
    let saveData = UserDefaults.standard
    let saveDatatext = UserDefaults.standard
    var number1: Int = 0
    var number2: Int = 0
    var number3: Int = 0
    var number4: Int = 0
    var number5: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        number1 = saveData.integer(forKey: "NUM1")
        label1.text = String(number1)
        number2 = saveData.integer(forKey: "NUM2")
        label2.text = String(number2)
        number3 = saveData.integer(forKey: "NUM3")
        label3.text = String(number3)
        number4 = saveData.integer(forKey: "NUM4")
        label4.text = String(number4)
        number5 = saveData.integer(forKey: "NUM5")
        label5.text = String(number5)
        textField1.text = saveDatatext.string(forKey: "TEXT1")
        textField2.text = saveDatatext.string(forKey: "TEXT2")
        textField3.text = saveDatatext.string(forKey: "TEXT3")
        textField4.text = saveDatatext.string(forKey: "TEXT4")
        textField5.text = saveDatatext.string(forKey: "TEXT5")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func selectplus1(){
        number1 = number1 + 1
        label1.text = String(number1)
        saveData.set(number1, forKey: "NUM1")
        if number1 >= 3 {
            label1.textColor = UIColor.black
            
    }
    }
    @IBAction func selectminus1(){
        number1 = number1 - 1
        label1.text = String(number1)
        saveData.set(number1, forKey: "NUM1")
        if number1 <= 2 {
            label1.textColor = UIColor.red
        }
    }
    @IBAction func selectplus2(){
        number2 = number2 + 1
        label2.text = String(number2)
        saveData.set(number2, forKey: "NUM2")
        if number2 >= 3 {
         label2.textColor = UIColor.black
        }
        
    }
    @IBAction func selectminus2(){
      number2 = number2 - 1
        label2.text = String(number2)
        saveData.set(number2, forKey: "NUM2")
        if number2 <= 2 {
            label2.textColor = UIColor.red
        }
    }
    @IBAction func selectplus3(){
        number3 = number3 + 1
        label3.text = String(number3)
        saveData.set(number3, forKey: "NUM3")
        if number3 >= 3 {
            label3.textColor = UIColor.black
        }
    }
    @IBAction func selectminus3(){
        number3 = number3 - 1
        label3.text = String(number3)
        saveData.set(number3, forKey: "NUM3")
        if number3 <= 2{
            label3.textColor = UIColor.red
        }
    }
    @IBAction func selectplus4(){
        number4 = number4 + 1
        label4.text = String(number4)
        saveData.set(number4, forKey: "NUM4")
        if number4 >= 3{
            label4.textColor = UIColor.black
        }
    }
    @IBAction func selectminus4(){
        number4 = number4 - 1
        label4.text = String(number4)
        saveData.set(number4, forKey: "NUM4")
        if number4 <= 2 {
            label4.textColor = UIColor.red
        }
    }
    @IBAction func selectplus5(){
        number5 = number5 + 1
        label5.text = String(number5)
        saveData.set(number5, forKey: "NUM5")
        if  number5 >= 3{
            label5.textColor = UIColor.black
        }
    }
    @IBAction func selectminus5(){
        number5 = number5 - 1
        label5.text = String(number5)
        saveData.set(number5, forKey: "NUM5")
        if number5 <= 2{
            label5.textColor = UIColor.red
        }
    }
    @IBAction func selecthozon(){
        saveDatatext.set(textField1.text, forKey: "TEXT1")
        saveDatatext.set(textField2.text, forKey: "TEXT2")
        saveDatatext.set(textField3.text, forKey: "TEXT3")
        saveDatatext.set(textField4.text, forKey: "TEXT4")
        saveDatatext.set(textField5.text, forKey: "TEXT5")
        
    }
    
    


}

