//
//  LogTableViewController.swift
//  DiaBuddy
//
//  Created by Tracy Wei on 8/4/21.
//

import UIKit

class Record {
    
    var date = ""
    var time = ""
    var glucose = ""
    var exercise = ""
    var feet = ""
    var mood = ""
    var chl = ""
    
    init(myDate: String, myTime: String, myGlucose: String, myExercise: String, myFeet: String, myMood: String, myChl: String) {
        date = myDate
        time = myTime
        glucose = myGlucose
        exercise = myExercise
        feet = myFeet
        mood = myMood
        chl = myChl
    }
}

class RecordTableViewCell: UITableViewCell {
    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var glucose: UILabel!
    @IBOutlet weak var exerciseTime: UILabel!
    @IBOutlet weak var feet: UILabel!
    @IBOutlet weak var mood: UILabel!
    @IBOutlet weak var cholesterol: UILabel!
    
}

class LogTableViewController: UITableViewController {

    var date = ""
    var time = ""
    var mood = ""
    var feetCondition = ""
    var glucose = ""
    var cholesterol = ""
    var exercise = ""
    
    var records = [Record]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        records.append(Record(myDate: date, myTime: time, myGlucose: glucose, myExercise: exercise, myFeet: feetCondition, myMood: mood, myChl: cholesterol))
        
        tableView.rowHeight = 150
    }

    @IBAction func backTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return records.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! RecordTableViewCell


        let displayedRecord = records[indexPath.row]
        cell.date.text = displayedRecord.date
        cell.time.text = displayedRecord.time
        cell.glucose.text = "Glucose: \(displayedRecord.glucose) mg/dl"
        cell.exerciseTime.text = "Exercise: \(displayedRecord.exercise) minutes"
        cell.feet.text = "Feet: \(displayedRecord.feet)"
        cell.mood.text = "Mood: \(displayedRecord.mood)"
        cell.cholesterol.text = "Cholesterol: \(displayedRecord.chl) mg/dl"

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
