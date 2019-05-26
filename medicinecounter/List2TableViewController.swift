//
//  List2TableViewController.swift
//  medicinecounter
//
//  Created by 大原一倫 on 2017/08/20.
//  Copyright © 2017年 oharakazumasa. All rights reserved.
//

import UIKit

class List2TableViewController: UITableViewController {

    let saveData = UserDefaults.standard
    var medicine : [Dictionary<String, String>] = []
    var selectCell : Int? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectCell = nil
        
        tableView.register(UINib(nibName: "ListTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "cell")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if saveData.array(forKey: "MEDICINE2") != nil {
            medicine = saveData.array(forKey: "MEDICINE2") as! [Dictionary<String, String>]
        }
        tableView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return medicine.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                as! ListTableViewCell
            
            let nowIndexPath = medicine[indexPath.row]
            
            // テキストをintへ変換
            let str: String = medicine[indexPath.row]["count"]!
            let intNum: Int = Int(str)!
            
            // 条件を書く
            if intNum <= 2 {
                cell.countLabel.textColor = UIColor.red
            } else {
                cell.countLabel.textColor = UIColor.black
            }
            //
            cell.medicineLabel.text = nowIndexPath["text"]
            cell.countLabel.text = nowIndexPath["count"]
            return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectCell = indexPath.row
        if selectCell != nil {
            performSegue(withIdentifier: "toadd2View", sender: nil)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any!){
        if (segue.identifier == "toadd2View") {
            let subVC: addViewController = (segue.destination as? addViewController)!
            subVC.selectedCell = selectCell
        }
    }
    @IBAction func add2Btn(for segue: UIStoryboardSegue, sender: Any) {
        //        if (segue.identifier == "toaddView") {
        //            let subVC : addViewController = (segue.destination as? addViewController)!
        //            flag = true
        //            subVC.flagAfter = flag
        //        }
    }
    
    
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            medicine.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        }
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        saveData.set(medicine, forKey: "MEDICINE")
        selectCell = nil
        
    }
    
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

