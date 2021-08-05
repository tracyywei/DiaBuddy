//
//  WellnessViewController.swift
//  DiaBuddy
//
//  Created by Tracy Wei on 8/4/21.
//

import UIKit

class WellnessViewController: UIViewController {

    @IBOutlet weak var glucoseLevel: UITextField!
    @IBOutlet weak var cholesterol: UITextField!
    @IBOutlet weak var exerciseMin: UITextField!
    @IBOutlet weak var cutsButton: UIButton!
    @IBOutlet weak var swellingButton: UIButton!
    @IBOutlet weak var cornButton: UIButton!
    @IBOutlet weak var soreButton: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var happyButton: UIButton!
    @IBOutlet weak var sadButton: UIButton!
    @IBOutlet weak var mehButton: UIButton!
    @IBOutlet weak var ickyButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    
    var currentDate = ""
    var currentTime = ""
    var mood = ""
    var feetCondition = ""
    var glucose = ""
    var cholesterolLevel = ""
    var exercise = ""
    
    var nextVC = LogTableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetButton.isHidden = true
        messageLabel.isHidden = true
    }
    
    @IBAction func recordCheck(_ sender: UIButton) {
        messageLabel.isHidden = false
        resetButton.isHidden = false
        currentDate = getDate()
        currentTime = getTime()
        glucose = glucoseLevel.text!
        cholesterolLevel = cholesterol.text!
        exercise = exerciseMin.text!
        performSegue(withIdentifier: "moveToLog", sender: recordButton)
    }
    
    @IBAction func resetForm(_ sender: UIButton) {
        glucoseLevel.text = ""
        exerciseMin.text = ""
        cholesterol.text = ""
        cutsButton.backgroundColor = #colorLiteral(red: 0.8352941176, green: 0.9490196078, blue: 1, alpha: 1)
        swellingButton.backgroundColor = #colorLiteral(red: 0.8352941176, green: 0.9490196078, blue: 1, alpha: 1)
        cornButton.backgroundColor = #colorLiteral(red: 0.8352941176, green: 0.9490196078, blue: 1, alpha: 1)
        soreButton.backgroundColor = #colorLiteral(red: 0.8352941176, green: 0.9490196078, blue: 1, alpha: 1)
        happyButton.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        sadButton.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        mehButton.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        ickyButton.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        resetButton.isHidden = true
    }
    
    // Feet condition
    @IBAction func cutsTapped(_ sender: UIButton) {
        feetCondition = "Cuts"
        buttonTapped(selectedButton: cutsButton)
    }
    @IBAction func soreTapped(_ sender: UIButton) {
        feetCondition = "Sores/Blisters"
        buttonTapped(selectedButton: soreButton)
    }
    @IBAction func swellTapped(_ sender: UIButton) {
        feetCondition = "Swelling"
        buttonTapped(selectedButton: swellingButton)
    }
    @IBAction func cornTapped(_ sender: UIButton) {
        feetCondition = "Corns/Calluses"
        buttonTapped(selectedButton: cornButton)
    }
    
    // Mood
    @IBAction func happyTapped(_ sender: UIButton) {
        mood = "Happy"
        moodTapped(selectedButton: happyButton)
    }
    @IBAction func sadTapped(_ sender: UIButton) {
        mood = "Sad"
        moodTapped(selectedButton: sadButton)
    }
    @IBAction func mehTapped(_ sender: UIButton) {
        mood = "Neutral"
        moodTapped(selectedButton: mehButton)
    }
    @IBAction func ickyTapped(_ sender: UIButton) {
        mood = "Discomfort"
        moodTapped(selectedButton: ickyButton)
    }
    
    func buttonTapped(selectedButton: UIButton) {
        selectedButton.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    
    func moodTapped(selectedButton: UIButton) {
        selectedButton.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    
    func getDate() -> String{

        let date = Date()
        let calender = Calendar.current
        let components = calender.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)

        let year = components.year
        let month = components.month
        let day = components.day

        let dateString = String(year!) + "-" + String(month!) + "-" + String(day!)
        print(dateString)
        return dateString

    }
    
    func getTime() -> String{

        let date = Date()
        let calender = Calendar.current
        let components = calender.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)

        let hour = components.hour
        let minute = components.minute

        let timeString = String(hour!)  + ":" + String(minute!)
        print(timeString)
        return timeString

    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVC = segue.destination as! LogTableViewController
            destinationVC.date = currentDate
            destinationVC.time = currentTime
            destinationVC.glucose = glucose
            destinationVC.cholesterol = cholesterolLevel
            destinationVC.exercise = exercise
            destinationVC.feetCondition = feetCondition
            destinationVC.mood = mood
          
    }
    

}
