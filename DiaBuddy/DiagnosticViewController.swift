//
//  DiagnosticViewController.swift
//  DiaBuddy
//
//  Created by Tracy Wei on 8/4/21.
//

import UIKit

class DiagnosticViewController: UIViewController {

    @IBOutlet weak var questionNum: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var restartButton: UIButton!
    
    var score = 0       // >= 5: high risk or diabetic symptoms
    var questionCount = 0
    
    var questions = ["Have you noticed an increase in urination?",
                     "Have you noticed an increase in thrist?",
                     "Have you noticed unexpected weight loss?",
                     "Has anyone in your family been diagnosed with diabetes? Does your family have a history of diabetes?",
                     "Do you eat a balanced diet?",
                     "Have you recently felt fatigued?",
                     "Have you been diagnosed with obesity?"
                    ]
    
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
        if questionCount != 4 {
            score += 1
        }
        nextButton.isHidden = false
        yesButton.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        messageLabel.isHidden = false
        lastQ(currentNum: questionCount)
    }
    
    @IBAction func noTapped(_ sender: UIButton) {
        if questionCount == 4 {
            score += 1
        }
        nextButton.isHidden = false
        noButton.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        messageLabel.isHidden = false
        lastQ(currentNum: questionCount)
    }
    
    @IBAction func nextQ(_ sender: UIButton) {
        
        if questionCount == 6 {
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
        if currentNum == 6 {
            restartButton.isHidden = false
            performSegue(withIdentifier: "moveToResults", sender: nextButton)
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
        nextButton.isHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ResultsViewController
            destinationVC.score = score
    }

}
