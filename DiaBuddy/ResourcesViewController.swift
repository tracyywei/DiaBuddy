//
//  ResourcesViewController.swift
//  DiaBuddy
//
//  Created by Tracy Wei on 8/5/21.
//

import UIKit

class ResourcesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func symptomsTapped(_ sender: UIButton) {
        if let url = URL(string: "https://blog.ohiohealth.com/the-difference-between-type-1-and-type-2-diabetes/") {
            UIApplication.shared.open(url)
        }
    }
    @IBAction func webmdTapped(_ sender: UIButton) {
        if let url = URL(string: "https://www.webmd.com/diabetes/ss/slideshow-exercises-diabetes") {
            UIApplication.shared.open(url)
        }
    }
    @IBAction func harvardTapped(_ sender: UIButton) {
        if let url = URL(string: "https://www.health.harvard.edu/staying-healthy/the-importance-of-exercise-when-you-have-diabetes") {
            UIApplication.shared.open(url)
        }
    }
    @IBAction func actionsugarTapped(_ sender: UIButton) {
        if let url = URL(string: "http://www.actiononsugar.org") {
            UIApplication.shared.open(url)
        }
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
