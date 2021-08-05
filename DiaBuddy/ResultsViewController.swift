//
//  ResultsViewController.swift
//  DiaBuddy
//
//  Created by Tracy Wei on 8/4/21.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var explanationLabel: UILabel!
    
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if score >= 5 {
            resultLabel.text = "High Risk"
            explanationLabel.text = "Your answers indicate that you have shown many symptoms of diabetes. Diabetic symptoms include: increased thrist and urination, sudden weight loss, and feelings of fatigue. Factors that can increase the risk of diabetes include a history of diabetes in your family, obesity, and an unbalanced diet. We recommend that you see a doctor to receive an official diagnosis."
        }
        else if score >= 3 || score < 5 {
            resultLabel.text = "Intermediate Risk"
            explanationLabel.text = "Your answers indicate that you have shown some symptoms of diabetes. Diabetic symptoms include: increased thrist and urination, sudden weight loss, and feelings of fatigue. Factors that can increase the risk of diabetes include a history of diabetes in your family, obesity, and an unbalanced diet. We recommend that you continue to monitor your symptoms and see your doctor to receive an official diagnosis if needed. We also recommend that you maintain a well-balanced diet and consistently exercise."
        }
        else {
            resultLabel.text = "Low Risk"
            explanationLabel.text = "Your answers indicate that you have shown little to no symptoms of diabetes. Diabetic symptoms include: increased thrist and urination, sudden weight loss, and feelings of fatigue. Factors that can increase the risk of diabetes include a history of diabetes in your family, obesity, and an unbalanced diet. To verify, we recommend that you see a doctor to receive an official diagnosis if needed. We also recommend that you maintain a well-balanced diet and consistently exercise."
        }
        
    }
    
    @IBAction func backTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
