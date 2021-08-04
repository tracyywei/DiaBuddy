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
    
    var link = ""
    
    @IBAction func externalLink(_ sender: UIButton) {
        if let url = URL(string: "\(link)") {
            UIApplication.shared.open(url)
        }
    }
    
    
}

class RecommendViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var optionPanel: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    let recipes = [Recipe(recipeName: "Cheesy Diabetic Pizza", recipeLink: "https://easyhealthllc.com/low-carb-2/cheesy-crispy-diabetes-friendly-low-carb-pizza/", recipeImage: "cheesyPizza.jpg", recipeTime: "14 minutes"),
                   Recipe(recipeName: "Low Carb Turkey Roll Up", recipeLink: "https://easyhealthllc.com/low-carb-2/low-carb-tortilla-roll-up/", recipeImage: "tortilla-wrap.jpg", recipeTime: "5 minutes"),
                   Recipe(recipeName: "Oven Baked Rotisserie Chicken", recipeLink: "https://easyhealthllc.com/diabetes-diet/cooking-a-meal-for-a-friend-with-diabetes-rotisserie-chicken/", recipeImage: "chicken.jpg", recipeTime: "55 minutes"),
                   Recipe(recipeName: "Beef and Veggie Chili", recipeLink: "https://easyhealthllc.com/main-dish/beef-and-veggie-chili-made-diabetes-friendly/", recipeImage: "chili.jpg", recipeTime: "50 minutes"),
                   Recipe(recipeName: "Low Carb Bruschetta Chicken", recipeLink: "https://easyhealthllc.com/main-dish/low-carb-bruschetta-chicken/", recipeImage: "bruschetta.jpg", recipeTime: "30 minutes"),
                   Recipe(recipeName: "Greek Yogurt Skillet Roasted Chicken", recipeLink: "https://easyhealthllc.com/low-carb-2/greek-yogurt-skillet-roasted-chicken/", recipeImage: "greekyog.jpg", recipeTime: "2 hours"),
                   Recipe(recipeName: "Low Carb Mediterranean Chicken", recipeLink: "https://easyhealthllc.com/main-dish/low-carb-baked-greek-chicken/", recipeImage: "medchicken.jpg", recipeTime: "35 minutes"),
                   Recipe(recipeName: "Low Carb Chicken Alfredo", recipeLink: "https://easyhealthllc.com/low-carb-2/low-carb-chicken-alfredo/", recipeImage: "alfredo.jpg", recipeTime: "20 minutes"),
                   Recipe(recipeName: "Low Carb Cabbage Rolls", recipeLink: "https://easyhealthllc.com/low-carb-2/skillet-unstuffed-cabbage-rolls/", recipeImage: "cabbage.jpg", recipeTime: "30 minutes"),
                   Recipe(recipeName: "Italian Beef and Cheese Bowl", recipeLink: "https://easyhealthllc.com/low-carb-2/low-carb-steak-and-cheese-bowl/", recipeImage: "beefcheese.jpg", recipeTime: "30 minutes"),
                   Recipe(recipeName: "Pork Chops with Easy Mexican Rice", recipeLink: "https://easyhealthllc.com/main-dish/pork-chops-with-easy-mexican-rice/", recipeImage: "porkchop.jpg", recipeTime: "30 minutes"),
                   Recipe(recipeName: "Low Carb Patty Melt", recipeLink: "https://easyhealthllc.com/low-carb-2/low-carb-patty-melt/", recipeImage: "patty-melt.jpg", recipeTime: "35 minutes")]
    
    let exercises = [Exercise(exName: "HIIT workout", exLink: "https://www.youtube.com/watch?v=mHmCQ0ujlpE", exImage: "hiit.jpg", exTime: "Intense, 120-150 bpm"),
                     Exercise(exName: "Shooting hoops", exLink: "https://www.youtube.com/watch?v=SyvuSxCyfi0", exImage: "basketball.jpg", exTime: "Moderate, 115 bpm"),
                     Exercise(exName: "Walking", exLink: "https://www.youtube.com/watch?v=BBlVnY3W2zk", exImage: "walking.jpg", exTime: "Moderate, 115 bpm"),
                     Exercise(exName: "Tai Chi", exLink: "https://www.youtube.com/watch?v=B0QDRqHNNE8", exImage: "taichi.jpg", exTime: "Low"),
                     Exercise(exName: "Yoga", exLink: "https://www.youtube.com/watch?v=fmh58tykgpo", exImage: "yoga.jpg", exTime: "Low"),
                     Exercise(exName: "Dancing", exLink: "https://www.youtube.com/watch?v=1vRto-2MMZo", exImage: "dance.jpg", exTime: "Moderate/Intense"),
                     Exercise(exName: "Swimming", exLink: "https://www.youtube.com/watch?v=gh5mAtmeR3Y", exImage: "swim.jpg", exTime: "Moderate/Intense")]
   
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
            cell.link = exercises.link
        case 1:
            let recipes = recipes[indexPath.row]
            cell.photo.image = UIImage(named: "\(recipes.image)")
            cell.title.text = recipes.name
            cell.time.text = recipes.time
            cell.link = recipes.link
        default:
            break
        }

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
