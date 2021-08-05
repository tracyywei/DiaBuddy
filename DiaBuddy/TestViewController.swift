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
                     "Is blood sugar the same as glucose?" ,
                     "Is our diagnostic test more accurate than pharmaceutical screening tests?"
                    ]
    
    // Fill in the array with the messages for each question
    var messages = ["Type 1 diabetes is diabetes that is diagnosed in children and young adults. The form of treatment in type 1 diabetes is insulin, as the form of treatment in type 2 diabetes with an unknown cause (i.e genetically or because of obesity) is treated with medication, diets, and exercise.", "Specifically for Type 2 diabetics, fried food is not a good addition to their diet. It can cause weight gain, furthering the severity of their diabetes." , "Whether a diabetic is well controlled or not, all diabetics are immunocompromised. This means that their immune system is weaker than a typical person’s immune system. (https://www.pennmedicine.org)" , "Most people are diagnosed at a young age, but it is possible! Type 2 diabetes is typically more undiagnosed/diagnosed in older adults. " , "Yes, they are! Blood sugar/glucose flow through your bloodstream, and they are also the sources of energy you get from the foods you consume." , "No! Our diagnostic test is available just to give you an idea if you might be at risk of diabetes, or pre-diabetic. We definitely recommend getting a professional screening test if you are experiencing pre-diabetic symptoms!",

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
        nextButton.isHidden = false
        yesButton.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        messageLabel.isHidden = false
        
        if (questionCount == 0) {
            score += 1
            messageLabel.text = "\(messages[0])"
        }
        
        else if questionCount != 1 && questionCount != 5 {
            score += 1
            messageLabel.text = "Correct. \(messages[questionCount])"
        }
        
        else {
            messageLabel.text = "Incorrect. \(messages[questionCount])"
        }
        lastQ(currentNum: questionCount)
    }
    
    @IBAction func noTapped(_ sender: UIButton) {
        nextButton.isHidden = false
        noButton.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        messageLabel.isHidden = false
        
        if (questionCount == 0) {
            messageLabel.text = "\(messages[0])"
        }
        else if questionCount == 1 || questionCount == 5 {
            score += 1
            messageLabel.text = "Correct. \(messages[questionCount])"
        }
        else {
            messageLabel.text = "Incorret. \(messages[questionCount])"
        }
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
