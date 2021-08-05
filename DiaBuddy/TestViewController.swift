//
//  TestViewController.swift
//  DiaBuddy
//
//  Created by Tracy Wei on 8/4/21.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet weak var questionNum: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var restartButton: UIButton!
    
    var score = 0
    var questionCount = 0
    
    var questions = ["Do you know the difference between Type 1, and Type 2 Diabetes?",
                     "Are diabetics recommended to eat fried foods?",
                     "Are diabetics immunocompromised?",
                     "Can a person be diagnosed with diabetes at an older age (50-70+)?",
                    ]
    
    // Fill in the array with the messages for each question
    // var messages = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        questionCount = 0
        questionNum.text = "Question \(questionCount+1)"
        questionLabel.text = "\(questions[questionCount])"
        restartButton.isHidden = true
        yesButton.backgroundColor = #colorLiteral(red: 0.1882352941, green: 0.4980392157, blue: 0.8, alpha: 1)
        noButton.backgroundColor = #colorLiteral(red: 0.1882352941, green: 0.4980392157, blue: 0.8, alpha: 1)
        messageLabel.isHidden = true
        nextButton.isHidden = true
    }
    
    @IBAction func yesTapped(_ sender: UIButton) {
        if questionCount != 1 {
            score += 1
        }
        nextButton.isHidden = false
        yesButton.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        // ADD: change message label to the right explanation
        lastQ(currentNum: questionCount)
    }
    
    @IBAction func noTapped(_ sender: UIButton) {
        if questionCount == 1 {
            score += 1
        }
        nextButton.isHidden = false
        noButton.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        // ADD: change message label to the right explanation
        lastQ(currentNum: questionCount)
    }
    
    @IBAction func nextQ(_ sender: UIButton) {
        
        if questionCount == 3 {
            nextButton.isHidden = true
        }
        else {
            questionCount += 1
            questionNum.text = "Question \(questionCount+1)"
            questionLabel.text = "\(questions[questionCount])"
            yesButton.backgroundColor = #colorLiteral(red: 0.1882352941, green: 0.4980392157, blue: 0.8, alpha: 1)
            noButton.backgroundColor = #colorLiteral(red: 0.1882352941, green: 0.4980392157, blue: 0.8, alpha: 1)
            messageLabel.isHidden = true
        }
    }
    
    func lastQ(currentNum : Int) {
        if currentNum == 3 {
            restartButton.isHidden = false
            performSegue(withIdentifier: "moveToTestResults", sender: nextButton)
        }
    }
    
    @IBAction func restartTest(_ sender: UIButton) {
        questionCount = 0
        score = 0
        questionNum.text = "Question \(questionCount+1)"
        questionLabel.text = "\(questions[questionCount])"
        restartButton.isHidden = true
        yesButton.backgroundColor = #colorLiteral(red: 0.1882352941, green: 0.4980392157, blue: 0.8, alpha: 1)
        noButton.backgroundColor = #colorLiteral(red: 0.1882352941, green: 0.4980392157, blue: 0.8, alpha: 1)
        messageLabel.isHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TestResultsViewController
            destinationVC.score = score
            destinationVC.totalQs = questions.count
    }

}
