//
//  Tab.swift
//  FoodMenu
//
//  Created by Abdullah Karaboğa on 21.01.2023.
//

import SwiftUI

struct Food: Identifiable {
    var id = UUID().uuidString
    var title: String
    var description: String
    var price: String
    var image: String
}

var foods = [

    Food(title: "sdf", description: "sfdgfyj", price: "122", image: "image1"),
    Food(title: "sdf", description: "sfdgfyj", price: "122", image: "image1"),
    Food(title: "sdf", description: "sfdgfyj", price: "122", image: "image1"),
    Food(title: "sdf", description: "sfdgfyj", price: "122", image: "image1"),
    Food(title: "sdf", description: "sfdgfyj", price: "122", image: "image1"),
    Food(title: "sdf", description: "sfdgfyj", price: "122", image: "image1"),
    Food(title: "sdf", description: "sfdgfyj", price: "122", image: "image1"),
    Food(title: "sdf", description: "sfdgfyj", price: "122", image: "image1"),

]


struct Tab: Identifiable {
    var id = UUID().uuidString
    var tab: String
    var foods: [Food]
}

var tabItems = [

    Tab(tab: "Tab 1", foods: foods.shuffled()),
    Tab(tab: "Tab 2", foods: foods.shuffled()),
    Tab(tab: "Tab 3", foods: foods.shuffled()),
    Tab(tab: "Tab 4", foods: foods.shuffled()),
    Tab(tab: "Tab 5", foods: foods.shuffled()),
    Tab(tab: "Tab 6", foods: foods.shuffled()),

]
