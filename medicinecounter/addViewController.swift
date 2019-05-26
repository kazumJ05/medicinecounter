//
//  addViewController.swift
//  medicinecounter
//
//  Created by 大原一倫 on 2017/08/09.
//  Copyright © 2017年 oharakazumasa. All rights reserved.
//

import UIKit

class addViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var textField: UITextField!
    @IBOutlet var countField: UITextField!
    @IBOutlet var suuryouField: UITextField!
    @IBOutlet var suuryoulabel: UILabel!
    @IBOutlet var nuribotan: UIButton!
    @IBOutlet var nomibotan: UIButton!
    @IBOutlet var plusbotan: UIButton!
    @IBOutlet var minusbotan: UIButton!
    @IBOutlet var kosuuLabel: UILabel!
    @IBOutlet var tyuuigakiLabel: UILabel!

    //////////////////////////////////////////////////////////////////////////////////
    var medicine : [Dictionary<String, String>] = []
    var medicine1 : [Dictionary<String, String>] = []
    let saveData = UserDefaults.standard
    var selectedCell : Int!
    var selectedSection : Int!
    var number1: Int = 0
    /////////////////////////////////////////////////////////////////////////////////
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        countField.delegate = self
        suuryouField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if saveData.array(forKey: "MEDICINE") != nil {
            medicine = saveData.array(forKey: "MEDICINE") as! [Dictionary<String, String>]
        }
        
        if saveData.array(forKey: "MEDICINE1") != nil{
            medicine1 = saveData.array(forKey: "MEDICINE1") as! [Dictionary<String, String>]
            
        }
        
        //////////////////////////////////////////////////////////////////////////////////
        //cellが一度も選ばれてない状態だと落ちる
        if selectedCell != nil {
            if selectedSection == 0{
                textField.text = String(medicine[selectedCell!]["text"]!)
                countField.text = String(medicine[selectedCell!]["count"]!)
                suuryouField.isHidden = true
                suuryoulabel.isHidden = true
                nuribotan.isHidden = true
                kosuuLabel.isHidden = true
                tyuuigakiLabel.isHidden = true
            }else if selectedSection == 1{
                textField.text = String(medicine1[selectedCell!]["text"]!)
                countField.text = String(medicine1[selectedCell!]["count"]!)
                suuryouField.text = String(medicine1[selectedCell!]["suuryou"]!)
                nomibotan.isHidden = true
                tyuuigakiLabel.isHidden = true
            }
            
            //////////////////////////////////////////////////////////////////////////////////
            
            // Do any additional setup after loading the view.
        }else{
            plusbotan.isHidden = true
            minusbotan.isHidden = true
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func selectnuri() {
        if selectedCell != nil{
            //編集するとき
                medicine.remove(at: selectedCell!)
            let medicineDictionary = ["text": textField.text!, "count": countField.text!, "date": String(gettoday())]
                medicine.append(medicineDictionary)
                saveData.set(medicine, forKey: "MEDICINE")
            let alert = UIAlertController(title: "変更完了", message: "変更が完了しました。",preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else if selectedCell == nil{
            if countField.text == "" {
                let alert = UIAlertController(title: "エラー", message: "数量を入力してください。", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }else{
                let  medicineDictionary = ["text": textField.text!, "count": countField.text!, "date": String(gettoday())]
                medicine.append(medicineDictionary)
                saveData.set(medicine, forKey: "MEDICINE")
                let aleat = UIAlertController(title: "保存完了",message: "保存が完了しました",preferredStyle: .alert)
                aleat.addAction(UIAlertAction(title: "OK",style: .default,handler: nil))
                self.present(aleat, animated: true, completion: nil)
            }
        }
    }
    @IBAction func selectnomi() {
        if selectedCell != nil {
            
            if selectedSection == 1 {
                medicine1.remove(at: selectedCell!)
                let medicine1Dictionary = ["text": textField.text!,"count": countField.text!, "suuryou": suuryouField.text!, "date": String(gettoday())]
                medicine1.append(medicine1Dictionary)
                saveData.set(medicine1, forKey: "MEDICINE1")
            }
            
            let alert = UIAlertController(title: "変更完了", message: "変更が完了しました。",preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else if selectedCell == nil {
            
            if countField.text == "" {
                let  alert = UIAlertController(title: "エラー", message: "数量を入力してください。",preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated:  true, completion: nil)
                
            } else {
                
                if suuryouField.text == ""{
                    let alert = UIAlertController(title: "エラー", message: "一日の服用数を入力してください。", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    
                } else {
                    
                    let  medicine1Dictionary = ["text": textField.text!, "count": countField.text!, "suuryou": suuryouField.text!, "date": String(gettoday())]
                    medicine1.append(medicine1Dictionary)
                    saveData.set(medicine1, forKey: "MEDICINE1")
                    let aleat = UIAlertController(title: "保存完了",message: "保存が完了しました",preferredStyle: .alert)
                    aleat.addAction(UIAlertAction(title: "OK",style: .default,handler: nil))
                    self.present(aleat, animated: true, completion: nil)
                }
            }
        }
    }
    @IBAction func selectplus(){
        var num: String = countField.text!
        var str: String = countField.text!
        var intkazu: Int = Int(num)!
        var intNum: Int = Int(str)!
       
        if selectedSection == 0{
            intNum = intNum + 1
            if intNum >= 3{
                countField.textColor = UIColor.black
            }
            str = String(intNum)
            countField.text = str
            medicine[selectedCell!]["count"] = str
            saveData.set(medicine, forKey: "MEDICINE")
        }else if selectedSection == 1{
            intkazu = intkazu + 1
            if intkazu >= 10{
                countField.textColor = UIColor.black
            }
            num = String(intkazu)
            countField.text = num
            medicine1[selectedCell!]["count"] = num
            saveData.set(medicine1, forKey: "MEDICINE1")
        }
    }
    @IBAction func selectminus(){
        var str: String = countField.text!
        var num: String = countField.text!
        var intkazu: Int = Int(num)!
        var intNum: Int = Int(str)!
        if selectedSection == 0{
            intNum = intNum - 1
            if intNum <= 2{
                countField.textColor = UIColor.red
            }
            str = String(intNum)
            countField.text = str
            medicine[selectedCell!]["count"] = str
            saveData.set(medicine, forKey: "MEDICINE")
        }else if selectedSection == 1{
            intkazu = intkazu - 1
            if intkazu <= 10 {
                countField.textColor = UIColor.red
            }
            num = String(intkazu)
            countField.text = num
            medicine1[selectedCell!]["count"] = num
            saveData.set(medicine1, forKey: "MEDICINE1")
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        // キーボードを閉じる
        textField.resignFirstResponder()
        return true
    }
    func gettoday(format: String = "MM/dd") -> String {
        let now = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ja_JP")
        formatter.dateFormat = format
        return formatter.string(from: now as Date)
        
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
