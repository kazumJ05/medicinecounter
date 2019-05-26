//
//  ListTableViewCell.swift
//  medicinecounter
//
//  Created by 大原一倫 on 2017/08/09.
//  Copyright © 2017年 oharakazumasa. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    
    @IBOutlet var medicineLabel: UILabel!
    @IBOutlet var countLabel: UILabel!
    @IBOutlet var suuryouLabel: UILabel!
    @IBOutlet var nissuuLabel: UILabel!
    @IBOutlet var dayLabel: UILabel!
    
    var number1:Int = 0
    let saveData = UserDefaults.standard
    var medicine : [Dictionary<String, String>] = []
    var medicine1: [Dictionary<String, String>] = []
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
//        number1 = saveData.integer(forKey: "NUMBER")
//        countLabel.text = String(number1)
        
        // Initialization code
        
//        if saveData.array(forKey: "MEDICINE") != nil {
//            medicine = saveData.array(forKey: "MEDICINE") as! [Dictionary<String, String>]
//        }
//        
//        // 現在のpathを取得
//        let row = 0
//        let section = 0
//        let indexPath = IndexPath(row: row, section: section)
//        
//        // テキストをintへ変換
//        let str: String = medicine[indexPath.row]["count"]!
//        let intNum: Int = Int(str)!
//        
//        if intNum >= 3 {
//            countLabel.textColor = UIColor.blue
//        } else {
//            countLabel.textColor = UIColor.black
//        }
    
        
//        countLabel.text = medicine[indexPath.row]["count"]
//        print(medicine[indexPath.row]["count"]!)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    }
