//
//  RecommendViewController.swift
//  DiaBuddy
//
//  Created by Tracy Wei on 8/4/21.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var time: UILabel!
    
}

class RecommendViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var optionPanel: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    let recipes = [Recipe(recipeName: "Cheesy Diabetic Pizza", recipeLink: "https://easyhealthllc.com/low-carb-2/cheesy-crispy-diabetes-friendly-low-carb-pizza/", recipeImage: "cheesyPizza.jpg", recipeTime: "14 minutes"), Recipe(recipeName: "Low Carb Turkey Roll Up", recipeLink: "https://easyhealthllc.com/low-carb-2/low-carb-tortilla-roll-up/", recipeImage: "tortilla-wrap.jpg", recipeTime: "5 minutes")]
    
    let exercises = [Exercise(exName: "HIIT workout", exLink: "https://www.youtube.com/watch?v=mHmCQ0ujlpE", exImage: "hiit.jpg", exTime: "Intense, 120-150 bpm"), Exercise(exName: "Shooting hoops", exLink: "https://www.youtube.com/watch?v=SyvuSxCyfi0", exImage: "basketball.jpg", exTime: "Moderate, 115 bpm")]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 150
        
    }
    
    @IBAction func indexChanged(_ sender: UISegmentedControl) {
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch optionPanel.selectedSegmentIndex
        {
        case 0:
            return exercises.count
        case 1:
            return recipes.count
        default:
            break
        }
        
        return 0
 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! MyTableViewCell
        
        switch optionPanel.selectedSegmentIndex
        {
        case 0:
            let exercises = exercises[indexPath.row]
            cell.photo.image = UIImage(named: "\(exercises.image)")
            cell.title.text = exercises.name
            cell.time.text = exercises.time
        case 1:
            let recipes = recipes[indexPath.row]
            cell.photo.image = UIImage(named: "\(recipes.image)")
            cell.title.text = recipes.name
            cell.time.text = recipes.time
        default:
            break
        }
        /*
        if currentCategory == "Recipes" {
            let recipes = recipes[indexPath.row]
            cell.photo.image = UIImage(named: "\(recipes.image)")
            cell.title.text = recipes.name
            cell.time.text = recipes.time
        }
        else {
            let exercises = exercises[indexPath.row]
            cell.photo.image = UIImage(named: "\(exercises.image)")
            cell.title.text = exercises.name
            cell.time.text = exercises.time
        }
 */

      return cell
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
