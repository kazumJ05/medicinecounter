//
//  ListTableViewCell2.swift
//  medicinecounter
//
//  Created by 大原一倫 on 2017/08/20.
//  Copyright © 2017年 oharakazumasa. All rights reserved.
//

import UIKit

class ListTableViewCell2: UITableViewCell {
    
    @IBOutlet var medicineLabel: UILabel!
    @IBOutlet var countLabel: UILabel!
    @IBOutlet var suuryouLabel: UILabel!
    
    //var number2:Int = 0
   // let saveData = UserDefaults.standard
    //var medicine1 : [Dictionary<String, String>] = []
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
