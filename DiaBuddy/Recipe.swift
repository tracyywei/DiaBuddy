//
//  Recipe.swift
//  DiaBuddy
//
//  Created by Tracy Wei on 8/4/21.
//

import UIKit

class Recipe {
    
    var name = ""
    var link = ""
    var image = ""
    var time = ""
    
    init(recipeName: String, recipeLink: String, recipeImage: String, recipeTime: String) {
        name = recipeName
        link = recipeLink
        image = recipeImage
        time = recipeTime
    }
}
