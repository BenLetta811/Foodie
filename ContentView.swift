//
//  ContentView.swift
//  Foodie
//
//  Created by Benjamin Letta on 4/25/26.
//

import SwiftUI
import SwiftData
import Charts

// MARK: - SwiftData Model

@Model
final class FoodLogItem {
    var name: String
    var calories: Int
    var protein: Double
    var saturatedFat: Double
    var sugar: Double
    var sodium: Int
    var meal: String
    var date: Date

    init(
        name: String,
        calories: Int,
        protein: Double,
        saturatedFat: Double,
        sugar: Double,
        sodium: Int,
        meal: String,
        date: Date = .now
    ) {
        self.name = name
        self.calories = calories
        self.protein = protein
        self.saturatedFat = saturatedFat
        self.sugar = sugar
        self.sodium = sodium
        self.meal = meal
        self.date = date
    }
}

// MARK: - Meal Type

enum MealType: String, CaseIterable, Identifiable {
    case breakfast = "Breakfast"
    case lunch = "Lunch"
    case dinner = "Dinner"

    var id: String { rawValue }
}

// MARK: - Food Models

struct FoodItem: Identifiable {
    let id = UUID()
    let name: String
    let calories: Int
    let protein: Double      // grams
    let saturatedFat: Double // grams
    let sugar: Double        // grams
    let sodium: Int          // milligrams
    let foodGroup: String
    let image: String

    init(name: String, calories: Int, protein: Double, saturatedFat: Double, sugar: Double, sodium: Int, foodGroup: String, image: String) {
        self.name = name
        self.calories = calories
        self.protein = protein
        self.saturatedFat = saturatedFat
        self.sugar = sugar
        self.sodium = sodium
        self.foodGroup = foodGroup
        self.image = image
    }
    
    init(name: String, calories: Int, foodGroup: String, image: String) {
        self.name = name
        self.calories = calories
        self.protein = 0
        self.saturatedFat = 0
        self.sugar = 0
        self.sodium = 0
        self.foodGroup = foodGroup
        self.image = image
    }
}

struct FoodGroup: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
}

// MARK: - Food Groups

let foodGroups = [
    FoodGroup(name: "Fruits", icon: "leaf.fill"),
    FoodGroup(name: "Vegetables", icon: "carrot.fill"),
    FoodGroup(name: "Grains", icon: "circle.hexagongrid.fill"),
    FoodGroup(name: "Proteins", icon: "fish.fill"),
    FoodGroup(name: "Dairy", icon: "cup.and.saucer.fill"),
    FoodGroup(name: "Combination Dishes", icon: "fork.knife.circle.fill"),
    FoodGroup(name: "Confectionery", icon: "birthday.cake.fill"),
    FoodGroup(name: "Drinks", icon: "takeoutbag.and.cup.and.straw.fill")
]

let foods = [
    // Fruits
        FoodItem(name: "Apple",calories: 95, protein: 0.5, saturatedFat: 0.0, sugar: 19.0,sodium: 2, foodGroup: "Fruits", image: "apple"),
        FoodItem( name: "Banana", calories: 105,protein: 1.3,saturatedFat: 0.1,sugar: 14.4,sodium: 1,foodGroup: "Fruits",image: "banana"),
        FoodItem(name: "Orange",calories: 62, protein: 1.2,saturatedFat: 0.0,sugar: 12.2,sodium: 0, foodGroup: "Fruits",image: "orange"),
        FoodItem(name: "Strawberry",calories: 4, protein: 0.1,saturatedFat: 0.0, sugar: 0.6, sodium: 0,foodGroup: "Fruits",image: "strawberry"),
        FoodItem(name: "Blueberries",calories: 85,protein: 1.1, saturatedFat: 0.0,sugar: 15.0,sodium: 1,foodGroup: "Fruits",image: "blueberries"),
        FoodItem(name: "Grapes", calories: 104,protein: 1.1,saturatedFat: 0.0,sugar: 23.0,sodium: 3,foodGroup: "Fruits",image: "grapes"),
        FoodItem(name: "Watermelon",calories: 46,protein: 0.9,saturatedFat: 0.0,sugar: 9.4,sodium: 2,foodGroup: "Fruits", image: "watermelon"),
        FoodItem(name: "Pineapple",calories: 82,protein: 0.9,saturatedFat: 0.0,sugar: 16.3,sodium: 2,foodGroup: "Fruits", image: "pineapple"),
        FoodItem(name: "Mango",calories: 99,protein: 1.4,saturatedFat: 0.2,sugar: 22.5,sodium: 2,foodGroup: "Fruits",image: "mango"),
        FoodItem(name: "Peach",calories: 59,protein: 1.4,saturatedFat: 0.0,sugar: 13.0,sodium: 0,foodGroup: "Fruits",image: "peach"),
        FoodItem(name: "Pear",calories: 101,protein: 0.6,saturatedFat: 0.0,sugar: 17.0,sodium: 2,foodGroup: "Fruits", image: "pear"),
        FoodItem(name: "Kiwi",calories: 42,protein: 0.8,saturatedFat: 0.0,sugar: 6.2,sodium: 2, foodGroup: "Fruits",image: "kiwi"),
        FoodItem(name: "Lemon",calories: 17,protein: 0.6,saturatedFat: 0.0,sugar: 1.5,sodium: 1,foodGroup: "Fruits",image: "lemon"),
        FoodItem(name: "Lime",calories: 20,protein: 0.5,saturatedFat: 0.0,sugar: 1.1,sodium: 1,foodGroup: "Fruits",image: "lime"),
        FoodItem(name: "Cherry",calories: 5,protein: 0.1,saturatedFat: 0.0,sugar: 1.0,sodium: 0,foodGroup: "Fruits",image: "cherry"),
        FoodItem(name: "Raspberry",calories: 64,protein: 1.5,saturatedFat: 0.0,sugar: 5.4,sodium: 1,foodGroup: "Fruits",image: "raspberry"),
        FoodItem(name: "Blackberry",calories: 62,protein: 2.0,saturatedFat: 0.0,sugar: 7.0,sodium: 1,foodGroup: "Fruits",image: "blackberry"),
        FoodItem(name: "Coconut",calories: 283,protein: 2.7,saturatedFat: 24.0,sugar: 7.4,sodium: 20,foodGroup: "Fruits",image: "coconut"),
        FoodItem(name: "Smoothie",calories: 250,protein: 5.0,saturatedFat: 1.0,sugar: 45.0,sodium: 75,foodGroup: "Fruits",image: "smoothie"),
// Vegetables
            FoodItem(name: "Carrots",calories: 41,protein: 0.9,saturatedFat: 0.0,sugar: 4.7,sodium: 69,foodGroup: "Vegetables",image: "carrots"),
            FoodItem(name: "Broccoli",calories: 55,protein: 3.7,saturatedFat: 0.1,sugar: 2.2,sodium: 49,foodGroup: "Vegetables",image: "broccoli"),
            FoodItem(name: "Spinach",calories: 23,protein: 2.9,saturatedFat: 0.1,sugar: 0.4,sodium: 79,foodGroup: "Vegetables",image: "spinach"),
            FoodItem(name: "Lettuce",calories: 15,protein: 1.4,saturatedFat: 0.0,sugar: 0.8,sodium: 28,foodGroup: "Vegetables",image: "lettuce"),
            FoodItem(name: "Cucumber",calories: 16,protein: 0.7,saturatedFat: 0.0,sugar: 1.7,sodium: 2,foodGroup: "Vegetables",image: "cucumber"),
            FoodItem(name: "Tomato",calories: 22,protein: 1.1,saturatedFat: 0.0,sugar: 3.2,sodium: 6,foodGroup: "Vegetables",image: "tomato"),
            FoodItem(name: "Bell Pepper",calories: 24,protein: 1.0,saturatedFat: 0.0,sugar: 4.2,sodium: 3,foodGroup: "Vegetables",image: "bell pepper"),
            FoodItem(name: "Onion",calories: 44,protein: 1.2,saturatedFat: 0.0,sugar: 4.7,sodium: 4,foodGroup: "Vegetables",image: "onion"),
            FoodItem(name: "Celery",calories: 10,protein: 0.5,saturatedFat: 0.0,sugar: 1.0,sodium: 35,foodGroup: "Vegetables",image: "celery"),
            FoodItem(name: "Corn",calories: 96,protein: 3.4,saturatedFat: 0.2,sugar: 6.8,sodium: 15,foodGroup: "Vegetables",image: "corn"),
            FoodItem(name: "Green Beans",calories: 31,protein: 1.8,saturatedFat: 0.0,sugar: 3.3,sodium: 6,foodGroup: "Vegetables",image: "green beans"),
            FoodItem(name: "Peas",calories: 81,protein: 5.4,saturatedFat: 0.1,sugar: 5.7,sodium: 5,foodGroup: "Vegetables",image: "peas"),
            FoodItem(name: "Sweet Potato",calories: 112,protein: 2.0,saturatedFat: 0.0,sugar: 5.4,sodium: 72,foodGroup: "Vegetables",image: "sweet potato"),
            FoodItem(name: "Potato",calories: 163,protein: 4.3,saturatedFat: 0.0,sugar: 1.7,sodium: 17,foodGroup: "Vegetables",image: "potato"),
            FoodItem(name: "Cauliflower",calories: 25,protein: 1.9,saturatedFat: 0.1,sugar: 2.0,sodium: 30,foodGroup: "Vegetables",image: "cauliflower"),
            FoodItem(name: "Cabbage",calories: 22,protein: 1.1,saturatedFat: 0.0,sugar: 2.8,sodium: 16,foodGroup: "Vegetables",image: "cabbage"),
            FoodItem(name: "Zucchini",calories: 17,protein: 1.2,saturatedFat: 0.1,sugar: 2.5,sodium: 8,foodGroup: "Vegetables",image: "zucchini"),
            FoodItem(name: "Mushrooms",calories: 22,protein: 3.1,saturatedFat: 0.1,sugar: 2.0,sodium: 5,foodGroup: "Vegetables",image: "mushrooms"),
            FoodItem(name: "Asparagus",calories: 20,protein: 2.2,saturatedFat: 0.0,sugar: 1.9,sodium: 2,foodGroup: "Vegetables",image: "asparagus"),
            FoodItem(name: "Brussels Sprouts",calories: 43,protein: 3.4,saturatedFat: 0.1,sugar: 2.2,sodium: 25,foodGroup: "Vegetables",image: "brussels sprouts"),
            FoodItem(name: "Kale",calories: 33,protein: 2.9,saturatedFat: 0.1,sugar: 1.3,sodium: 25,foodGroup: "Vegetables",image: "kale"),
            FoodItem(name: "Eggplant",calories: 25,protein: 1.0,saturatedFat: 0.0,sugar: 3.5,sodium: 2,foodGroup: "Vegetables",image: "eggplant"),
            FoodItem(name: "Radishes",calories: 19,protein: 0.8,saturatedFat: 0.0,sugar: 2.0,sodium: 45,foodGroup: "Vegetables",image: "radishes"),
            FoodItem(name: "Beets",calories: 43,protein: 1.6,saturatedFat: 0.0,sugar: 6.8,sodium: 78,foodGroup: "Vegetables",image: "beets"),
    //Grains
            FoodItem(name: "Rice",calories: 206,protein: 4.3,saturatedFat: 0.1,sugar: 0.1,sodium: 2,foodGroup: "Grains",image: "rice"),
            FoodItem(name: "Brown Rice",calories: 216,protein: 5.0,saturatedFat: 0.3,sugar: 0.7,sodium: 10,foodGroup: "Grains",image: "brown rice"),
            FoodItem(name: "White Bread",calories: 79,protein: 2.7,saturatedFat: 0.2,sugar: 1.4,sodium: 146,foodGroup: "Grains",image: "white bread"),
            FoodItem(name: "Whole Wheat Bread",calories: 81,protein: 4.0,saturatedFat: 0.2,sugar: 1.8,sodium: 144,foodGroup: "Grains",image: "whole wheat bread"),
            FoodItem(name: "Pasta",calories: 310,protein: 11.0,saturatedFat: 0.3,sugar: 1.1,sodium: 5,foodGroup: "Grains",image: "pasta"),
            FoodItem(name: "Spaghetti",calories: 221,protein: 8.1,saturatedFat: 0.2,sugar: 0.8,sodium: 1,foodGroup: "Grains",image: "spaghetti"),
            FoodItem(name: "Oatmeal",calories: 158,protein: 6.0,saturatedFat: 0.5,sugar: 1.1,sodium: 2,foodGroup: "Grains",image: "oatmeal"),
            FoodItem(name: "Quinoa",calories: 222,protein: 8.1,saturatedFat: 0.4,sugar: 1.6,sodium: 13,foodGroup: "Grains",image: "quinoa"),
            FoodItem(name: "Barley",calories: 193,protein: 3.6,saturatedFat: 0.2,sugar: 0.4,sodium: 5,foodGroup: "Grains",image: "barley"),
            FoodItem(name: "Cornbread",calories: 198,protein: 5.3,saturatedFat: 1.0,sugar: 6.5,sodium: 417,foodGroup: "Grains",image: "cornbread"),
            FoodItem(name: "Pancakes",calories: 227,protein: 6.0,saturatedFat: 2.0,sugar: 6.0,sodium: 439,foodGroup: "Grains",image: "pancakes"),
            FoodItem(name: "Waffles",calories: 291,protein: 8.0,saturatedFat: 2.3,sugar: 4.9,sodium: 511,foodGroup: "Grains",image: "waffles"),
            FoodItem(name: "Bagel",calories: 289,protein: 11.0,saturatedFat: 0.3,sugar: 5.0,sodium: 561,foodGroup: "Grains",image: "bagel"),
            FoodItem(name: "English Muffin",calories: 134,protein: 4.4,saturatedFat: 0.2,sugar: 1.5,sodium: 246,foodGroup: "Grains",image: "english muffin"),
            FoodItem(name: "Crackers",calories: 120,protein: 2.0,saturatedFat: 0.8,sugar: 1.2,sodium: 220,foodGroup: "Grains",image: "crackers"),
            FoodItem(name: "Popcorn",calories: 31,protein: 1.0,saturatedFat: 0.1,sugar: 0.1,sodium: 1,foodGroup: "Grains",image: "popcorn"),
            FoodItem(name: "Tortilla",calories: 104,protein: 2.8,saturatedFat: 0.4,sugar: 0.5,sodium: 214,foodGroup: "Grains",image: "tortilla"),
            FoodItem(name: "Granola",calories: 220,protein: 5.0,saturatedFat: 0.9,sugar: 12.0,sodium: 58,foodGroup: "Grains",image: "granola"),
            FoodItem(name: "Breakfast Cereal",calories: 150,protein: 3.0,saturatedFat: 0.2,sugar: 10.0,sodium: 180,foodGroup: "Grains",image: "breakfast cereal"),
            FoodItem(name: "Donut",calories: 195,protein: 2.1,saturatedFat: 3.6,sugar: 10.5,sodium: 190,foodGroup: "Grains",image: "donut"),
    // Proteins
            FoodItem(name: "Chicken Breast",calories: 165,protein: 31.0,saturatedFat: 1.0,sugar: 0.0,sodium: 74,foodGroup: "Proteins",image: "chicken breast"),
            FoodItem(name: "Steak",calories: 679,protein: 62.0,saturatedFat: 15.0,sugar: 0.0,sodium: 150,foodGroup: "Proteins",image: "steak"),
            FoodItem(name: "Salmon",calories: 233,protein: 25.0,saturatedFat: 3.1,sugar: 0.0,sodium: 75,foodGroup: "Proteins",image: "salmon"),
            FoodItem(name: "Tuna",calories: 179,protein: 39.0,saturatedFat: 0.5,sugar: 0.0,sodium: 42,foodGroup: "Proteins",image: "tuna"),
            FoodItem(name: "Shrimp",calories: 99,protein: 24.0,saturatedFat: 0.1,sugar: 0.0,sodium: 111,foodGroup: "Proteins",image: "shrimp"),
            FoodItem(name: "Eggs",calories: 78,protein: 6.3,saturatedFat: 1.6,sugar: 0.2,sodium: 62,foodGroup: "Proteins",image: "eggs"),
            FoodItem(name: "Scrambled Eggs",calories: 180,protein: 12.0,saturatedFat: 3.3,sugar: 1.1,sodium: 180,foodGroup: "Proteins",image: "scrambled eggs"),
            FoodItem(name: "Fried Chicken",calories: 320,protein: 24.0,saturatedFat: 4.5,sugar: 0.0,sodium: 780,foodGroup: "Proteins",image: "fried chicken"),
            FoodItem(name: "Hot Dog",calories: 151,protein: 5.5,saturatedFat: 5.3,sugar: 1.6,sodium: 567,foodGroup: "Proteins",image: "hot dog"),
            FoodItem(name: "Turkey",calories: 189,protein: 29.0,saturatedFat: 2.0,sugar: 0.0,sodium: 109,foodGroup: "Proteins",image: "turkey"),
            FoodItem(name: "Ham",calories: 145,protein: 21.0,saturatedFat: 2.1,sugar: 1.3,sodium: 1117,foodGroup: "Proteins",image: "ham"),
            FoodItem(name: "Bacon",calories: 43,protein: 3.0,saturatedFat: 1.3,sugar: 0.1,sodium: 137,foodGroup: "Proteins",image: "bacon"),
            FoodItem(name: "Pork Chop",calories: 231,protein: 29.0,saturatedFat: 3.9,sugar: 0.0,sodium: 62,foodGroup: "Proteins",image: "pork chop"),
            FoodItem(name: "Tofu",calories: 144,protein: 17.0,saturatedFat: 1.0,sugar: 0.6,sodium: 14,foodGroup: "Proteins",image: "tofu"),
            FoodItem(name: "Black Beans",calories: 227,protein: 15.2,saturatedFat: 0.2,sugar: 0.6,sodium: 2,foodGroup: "Proteins",image: "black beans"),
            FoodItem(name: "Lentils",calories: 230,protein: 17.9,saturatedFat: 0.1,sugar: 3.6,sodium: 4,foodGroup: "Proteins",image: "lentils"),
            FoodItem(name: "Peanut Butter",calories: 188,protein: 8.0,saturatedFat: 3.3,sugar: 3.2,sodium: 147,foodGroup: "Proteins",image: "peanut butter"),
            FoodItem(name: "Almonds",calories: 164,protein: 6.0,saturatedFat: 1.1,sugar: 1.2,sodium: 0,foodGroup: "Proteins",image: "almonds"),
            FoodItem(name: "Cashews",calories: 157,protein: 5.2,saturatedFat: 2.2,sugar: 1.7,sodium: 3,foodGroup: "Proteins",image: "cashews"),
            FoodItem(name: "Greek Yogurt",calories: 100,protein: 17.0,saturatedFat: 0.7,sugar: 6.0,sodium: 65,foodGroup: "Proteins",image: "greek yogurt"),
// Dairy
            FoodItem(name: "Milk",calories: 103,protein: 8.0,saturatedFat: 3.1,sugar: 12.0,sodium: 107,foodGroup: "Dairy",image: "milk"),
            FoodItem(name: "Whole Milk",calories: 149,protein: 7.7,saturatedFat: 4.6,sugar: 12.3,sodium: 105,foodGroup: "Dairy",image: "whole milk"),
            FoodItem(name: "Skim Milk",calories: 83,protein: 8.3,saturatedFat: 0.1,sugar: 12.4,sodium: 103,foodGroup: "Dairy",image: "skim milk"),
            FoodItem(name: "Yogurt",calories: 59,protein: 10.0,saturatedFat: 0.1,sugar: 3.6,sodium: 36,foodGroup: "Dairy",image: "yogurt"),
            FoodItem(name: "Greek Yogurt",calories: 100,protein: 17.0,saturatedFat: 0.7,sugar: 6.0,sodium: 65,foodGroup: "Dairy",image: "greek yogurt"),
            FoodItem(name: "Ice Cream",calories: 137,protein: 2.3,saturatedFat: 4.5,sugar: 14.0,sodium: 53,foodGroup: "Dairy",image: "ice cream"),
            FoodItem(name: "Cheddar Cheese",calories: 113,protein: 7.0,saturatedFat: 5.4,sugar: 0.1,sodium: 174,foodGroup: "Dairy",image: "cheddar cheese"),
            FoodItem(name: "Mozzarella Cheese",calories: 85,protein: 6.3,saturatedFat: 3.1,sugar: 0.6,sodium: 176,foodGroup: "Dairy",image: "mozzarella cheese"),
            FoodItem(name: "Swiss Cheese",calories: 111,protein: 8.0,saturatedFat: 3.9,sugar: 0.4,sodium: 54,foodGroup: "Dairy",image: "swiss cheese"),
            FoodItem(name: "Cottage Cheese",calories: 98,protein: 11.0,saturatedFat: 1.6,sugar: 3.4,sodium: 364,foodGroup: "Dairy",image: "cottage cheese"),
            FoodItem(name: "Cream Cheese",calories: 99,protein: 2.0,saturatedFat: 5.6,sugar: 1.0,sodium: 105,foodGroup: "Dairy",image: "cream cheese"),
            FoodItem(name: "Butter",calories: 102,protein: 0.1,saturatedFat: 7.2,sugar: 0.0,sodium: 82,foodGroup: "Dairy",image: "butter"),
            FoodItem(name: "Sour Cream",calories: 23,protein: 0.3,saturatedFat: 1.5,sugar: 0.4,sodium: 9,foodGroup: "Dairy",image: "sour cream"),
            FoodItem(name: "Whipping Cream",calories: 52,protein: 0.3,saturatedFat: 3.4,sugar: 0.4,sodium: 5,foodGroup: "Dairy",image: "whipping cream"),
            FoodItem(name: "Chocolate Milk",calories: 190,protein: 8.0,saturatedFat: 3.2,sugar: 24.0,sodium: 150,foodGroup: "Dairy",image: "chocolate milk"),
            FoodItem(name: "Milkshake",calories: 300,protein: 8.5,saturatedFat: 6.0,sugar: 45.0,sodium: 200,foodGroup: "Dairy",image: "milkshake"),
            FoodItem(name: "Frozen Yogurt",calories: 110,protein: 4.0,saturatedFat: 2.0,sugar: 17.0,sodium: 60,foodGroup: "Dairy",image: "frozen yogurt"),
            FoodItem(name: "Parmesan Cheese",calories: 122,protein: 11.0,saturatedFat: 4.2,sugar: 0.2,sodium: 454,foodGroup: "Dairy",image: "parmesan cheese"),
            FoodItem(name: "Goat Cheese",calories: 103,protein: 6.0,saturatedFat: 5.0,sugar: 0.0,sodium: 130,foodGroup: "Dairy",image: "goat cheese"),
            FoodItem(name: "Ricotta Cheese",calories: 174,protein: 11.0,saturatedFat: 8.0,sugar: 0.7,sodium: 84,foodGroup: "Dairy",image: "ricotta cheese"),
// Combination Dishes
        FoodItem(name: "Pizza Slice", calories: 285, protein: 12.0, saturatedFat: 5.0, sugar: 3.8, sodium: 640, foodGroup: "Combination Dishes", image: "pizza slice"),
        FoodItem(name: "Taco", calories: 156, protein: 8.0, saturatedFat: 3.0, sugar: 1.5, sodium: 350, foodGroup: "Combination Dishes", image: "taco"),
        FoodItem(name: "Cheeseburger", calories: 354, protein: 17.0, saturatedFat: 8.0, sugar: 6.0, sodium: 720, foodGroup: "Combination Dishes", image: "cheeseburger"),
        FoodItem(name: "Sushi Roll", calories: 200, protein: 9.0, saturatedFat: 1.0, sugar: 2.5, sodium: 450, foodGroup: "Combination Dishes", image: "sushi roll"),
        FoodItem(name: "Burrito", calories: 430, protein: 18.0, saturatedFat: 7.0, sugar: 4.0, sodium: 980, foodGroup: "Combination Dishes", image: "burrito"),
        FoodItem(name: "Grilled Cheese", calories: 291, protein: 12.0, saturatedFat: 9.0, sugar: 3.0, sodium: 780, foodGroup: "Combination Dishes", image: "grilled cheese"),
        FoodItem(name: "Peanut Butter Sandwich", calories: 350, protein: 13.0, saturatedFat: 3.0, sugar: 9.0, sodium: 420, foodGroup: "Combination Dishes", image: "peanut butter sandwich"),
        FoodItem(name: "Nachos", calories: 346, protein: 9.0, saturatedFat: 6.0, sugar: 2.0, sodium: 520, foodGroup: "Combination Dishes", image: "nachos"),
        FoodItem(name: "Chicken Nuggets", calories: 270, protein: 14.0, saturatedFat: 3.0, sugar: 0.0, sodium: 540, foodGroup: "Combination Dishes", image: "chicken nuggets"),
        FoodItem(name: "Mac & Cheese", calories: 310, protein: 11.0, saturatedFat: 6.0, sugar: 3.5, sodium: 720, foodGroup: "Combination Dishes", image: "mac & cheese"),
        FoodItem(name: "Quesadilla", calories: 320, protein: 15.0, saturatedFat: 7.0, sugar: 2.0, sodium: 700, foodGroup: "Combination Dishes", image: "quesadilla"),
        FoodItem(name: "Shawarma", calories: 400, protein: 24.0, saturatedFat: 5.0, sugar: 3.0, sodium: 760, foodGroup: "Combination Dishes", image: "shawarma"),
        FoodItem(name: "Gyro", calories: 390, protein: 22.0, saturatedFat: 8.0, sugar: 4.0, sodium: 820, foodGroup: "Combination Dishes", image: "gyro"),
        FoodItem(name: "Lasagna", calories: 380, protein: 20.0, saturatedFat: 8.0, sugar: 7.0, sodium: 720, foodGroup: "Combination Dishes", image: "lasagna"),
        FoodItem(name: "Breakfast Burrito", calories: 520, protein: 24.0, saturatedFat: 10.0, sugar: 3.0, sodium: 1150, foodGroup: "Combination Dishes", image: "breakfast burrito"),
        FoodItem(name: "Fried Rice", calories: 333, protein: 8.0, saturatedFat: 3.0, sugar: 1.5, sodium: 650, foodGroup: "Combination Dishes", image: "fried rice"),
        FoodItem(name: "Pasta Alfredo", calories: 540, protein: 16.0, saturatedFat: 12.0, sugar: 3.0, sodium: 950, foodGroup: "Combination Dishes", image: "pasta alfredo"),
// Confectionary
        FoodItem(name: "Chocolate Cake", calories: 352, protein: 4.5, saturatedFat: 8.0, sugar: 35.0, sodium: 330, foodGroup: "Confectionery", image: "chocolate cake"),
        FoodItem(name: "Cookie", calories: 160, protein: 2.0, saturatedFat: 3.0, sugar: 12.0, sodium: 120, foodGroup: "Confectionery", image: "cookie"),
        FoodItem(name: "Brownie", calories: 243, protein: 3.0, saturatedFat: 4.0, sugar: 22.0, sodium: 160, foodGroup: "Confectionery", image: "brownie"),
        FoodItem(name: "Cupcake", calories: 305, protein: 3.5, saturatedFat: 5.0, sugar: 34.0, sodium: 220, foodGroup: "Confectionery", image: "cupcake"),
        FoodItem(name: "Chocolate Chip Cookie", calories: 148, protein: 1.8, saturatedFat: 3.5, sugar: 14.0, sodium: 95, foodGroup: "Confectionery", image: "chocolate chip cookie"),
        FoodItem(name: "Sugar Cookie", calories: 150, protein: 1.6, saturatedFat: 3.0, sugar: 12.0, sodium: 105, foodGroup: "Confectionery", image: "sugar cookie"),
        FoodItem(name: "Donut", calories: 195, protein: 2.6, saturatedFat: 3.5, sugar: 10.0, sodium: 190, foodGroup: "Confectionery", image: "donut"),
        FoodItem(name: "Glazed Donut", calories: 269, protein: 3.5, saturatedFat: 5.0, sugar: 14.0, sodium: 230, foodGroup: "Confectionery", image: "glazed donut"),
        FoodItem(name: "Cinnamon Roll", calories: 407, protein: 6.0, saturatedFat: 6.0, sugar: 32.0, sodium: 340, foodGroup: "Confectionery", image: "cinnamon roll"),
        FoodItem(name: "Muffin", calories: 377, protein: 6.0, saturatedFat: 4.0, sugar: 29.0, sodium: 320, foodGroup: "Confectionery", image: "muffin"),
        FoodItem(name: "Cheesecake", calories: 401, protein: 7.0, saturatedFat: 12.0, sugar: 27.0, sodium: 330, foodGroup: "Confectionery", image: "cheesecake"),
        FoodItem(name: "Apple Pie", calories: 296, protein: 2.5, saturatedFat: 5.0, sugar: 20.0, sodium: 260, foodGroup: "Confectionery", image: "apple pie"),
        FoodItem(name: "Pumpkin Pie", calories: 323, protein: 5.0, saturatedFat: 6.0, sugar: 25.0, sodium: 320, foodGroup: "Confectionery", image: "pumpkin pie"),
        FoodItem(name: "Cherry Pie", calories: 325, protein: 3.0, saturatedFat: 6.0, sugar: 26.0, sodium: 300, foodGroup: "Confectionery", image: "cherry pie"),
        FoodItem(name: "Chocolate Bar", calories: 229, protein: 3.0, saturatedFat: 7.0, sugar: 24.0, sodium: 20, foodGroup: "Confectionery", image: "chocolate bar"),
        FoodItem(name: "Candy Bar", calories: 250, protein: 3.0, saturatedFat: 6.0, sugar: 24.0, sodium: 120, foodGroup: "Confectionery", image: "candy bar"),
        FoodItem(name: "Gummy Bears", calories: 140, protein: 2.0, saturatedFat: 0.0, sugar: 23.0, sodium: 30, foodGroup: "Confectionery", image: "gummy bears"),
        FoodItem(name: "Jelly Beans", calories: 150, protein: 0.0, saturatedFat: 0.0, sugar: 28.0, sodium: 35, foodGroup: "Confectionery", image: "jelly beans"),
        FoodItem(name: "Marshmallows", calories: 90, protein: 1.0, saturatedFat: 0.0, sugar: 16.0, sodium: 20, foodGroup: "Confectionery", image: "marshmallows"),
        FoodItem(name: "Cotton Candy", calories: 105, protein: 0.0, saturatedFat: 0.0, sugar: 26.0, sodium: 5, foodGroup: "Confectionery", image: "cotton candy"),
// Drinks
        FoodItem(name: "Water", calories: 0, protein: 0.0, saturatedFat: 0.0, sugar: 0.0, sodium: 0, foodGroup: "Drinks", image: "water"),
        FoodItem(name: "Black Coffee", calories: 2, protein: 0.3, saturatedFat: 0.0, sugar: 0.0, sodium: 5, foodGroup: "Drinks", image: "black coffee"),
        FoodItem(name: "Coffee with Cream", calories: 35, protein: 0.6, saturatedFat: 0.6, sugar: 1.0, sodium: 15, foodGroup: "Drinks", image: "coffee with cream"),
        FoodItem(name: "Latte", calories: 190, protein: 12.0, saturatedFat: 3.5, sugar: 18.0, sodium: 180, foodGroup: "Drinks", image: "latte"),
        FoodItem(name: "Cappuccino", calories: 120, protein: 8.0, saturatedFat: 2.5, sugar: 10.0, sodium: 120, foodGroup: "Drinks", image: "cappuccino"),
        FoodItem(name: "Hot Chocolate", calories: 190, protein: 4.0, saturatedFat: 3.0, sugar: 24.0, sodium: 160, foodGroup: "Drinks", image: "hot chocolate"),
        FoodItem(name: "Green Tea", calories: 0, protein: 0.0, saturatedFat: 0.0, sugar: 0.0, sodium: 0, foodGroup: "Drinks", image: "green tea"),
        FoodItem(name: "Black Tea", calories: 2, protein: 0.0, saturatedFat: 0.0, sugar: 0.0, sodium: 5, foodGroup: "Drinks", image: "black tea"),
        FoodItem(name: "Orange Juice", calories: 112, protein: 2.0, saturatedFat: 0.0, sugar: 21.0, sodium: 2, foodGroup: "Drinks", image: "orange juice"),
        FoodItem(name: "Apple Juice", calories: 114, protein: 0.1, saturatedFat: 0.0, sugar: 24.0, sodium: 7, foodGroup: "Drinks", image: "apple juice"),
        FoodItem(name: "Lemonade", calories: 99, protein: 0.1, saturatedFat: 0.0, sugar: 25.0, sodium: 10, foodGroup: "Drinks", image: "lemonade"),
        FoodItem(name: "Milk", calories: 103, protein: 8.0, saturatedFat: 3.1, sugar: 12.0, sodium: 107, foodGroup: "Drinks", image: "milk"),
        FoodItem(name: "Chocolate Milk", calories: 190, protein: 8.0, saturatedFat: 3.2, sugar: 24.0, sodium: 150, foodGroup: "Drinks", image: "chocolate milk"),
        FoodItem(name: "Smoothie", calories: 250, protein: 5.0, saturatedFat: 1.0, sugar: 45.0, sodium: 75, foodGroup: "Drinks", image: "smoothie"),
        FoodItem(name: "Protein Shake", calories: 160, protein: 20.0, saturatedFat: 1.5, sugar: 3.0, sodium: 180, foodGroup: "Drinks", image: "protein shake"),
        FoodItem(name: "Soda", calories: 150, protein: 0.0, saturatedFat: 0.0, sugar: 39.0, sodium: 30, foodGroup: "Drinks", image: "soda"),
        FoodItem(name: "Diet Soda", calories: 0, protein: 0.0, saturatedFat: 0.0, sugar: 0.0, sodium: 40, foodGroup: "Drinks", image: "diet soda"),
        FoodItem(name: "Sports Drink", calories: 80, protein: 0.0, saturatedFat: 0.0, sugar: 21.0, sodium: 160, foodGroup: "Drinks", image: "sports drink"),
        FoodItem(name: "Energy Drink", calories: 110, protein: 1.0, saturatedFat: 0.0, sugar: 27.0, sodium: 200, foodGroup: "Drinks", image: "energy drink"),
        FoodItem(name: "Iced Tea", calories: 90, protein: 0.0, saturatedFat: 0.0, sugar: 22.0, sodium: 10, foodGroup: "Drinks", image: "iced tea"),
]

// MARK: - Healthy Tips

func healthyTips(for food: FoodItem) -> [String] {
    let name = food.name.lowercased()
    let kcal = food.calories
    var tips = [
        "Pair with vegetables or fruit for fiber.",
        "Watch portion size—small changes add up over the day.",
    ]

    if kcal >= 400 {
        tips.insert("Calorie-dense choice—consider a smaller portion or balance with lighter meals later.", at: 0)
    } else if kcal <= 120 {
        tips.insert("Light option—add protein if you need to stay full longer.", at: 0)
    }

    if name.contains("fries") || name.contains("fried") || name.contains("donut") {
        tips.insert("Limit fried foods; try baked or grilled versions when you can.", at: 0)
    }
    if name.contains("cake") || name.contains("cookie") || name.contains("ice cream") || name.contains("donut") {
        tips.insert("Treat foods are fine occasionally—enjoy mindfully and balance the rest of the day.", at: 0)
    }
    if name.contains("salad") || name.contains("apple") || name.contains("orange") || name.contains("banana") {
        tips.insert("Great pick for vitamins and fiber.", at: 0)
    }

    return Array(tips.prefix(3))
}

// MARK: - Views

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("🍎 Food Groups")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)

                List(foodGroups) { group in
                    NavigationLink(destination: FoodListView(group: group.name)) {
                        HStack(spacing: 15) {
                            Image(systemName: group.icon)
                                .font(.title2)
                                .foregroundColor(.green)
                                .frame(width: 35)

                            Text(group.name)
                                .font(.headline)
                        }
                        .padding(.vertical, 5)
                    }
                }
                .scrollContentBackground(.hidden)
            }
            .padding(.horizontal)
            .background(
                LinearGradient(
                    colors: [
                        Color.green.opacity(0.3),
                        Color.mint.opacity(0.15)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
            )
            //.navigationTitle("Food Groups")
            //.navigationBarTitleDisplayMode(.inline)
        }
    }
}

// MARK: - Food List Screen

struct FoodListView: View {
    let group: String

    @Query private var logs: [FoodLogItem]

    private enum Scope: String, CaseIterable, Identifiable { case today = "Today"; case all = "All"; var id: String { rawValue } }

    @State private var searchText = ""
    @State private var scope: Scope = .today
    @State private var selectedMeal: MealType = .breakfast
    @State private var addedMessage: String?
    @Environment(\.modelContext) private var context

    init(group: String) {
        self.group = group
        _logs = Query(sort: \FoodLogItem.date)
    }

    var filteredFoods: [FoodItem] {
        foods.filter {
            $0.foodGroup == group &&
            (searchText.isEmpty || $0.name.localizedCaseInsensitiveContains(searchText))
        }
    }

    var startOfToday: Date { Calendar.current.startOfDay(for: Date()) }
    var startOfTomorrow: Date { Calendar.current.date(byAdding: .day, value: 1, to: startOfToday)! }

    var logsForScope: [FoodLogItem] {
        switch scope {
        case .today:
            return logs.filter { $0.date >= startOfToday && $0.date < startOfTomorrow }
        case .all:
            return logs
        }
    }

    var mealLogs: [FoodLogItem] {
        logsForScope.filter { $0.meal == selectedMeal.rawValue }
    }

    func caloriesForMeal(_ meal: MealType) -> Int {
        logsForScope.filter { $0.meal == meal.rawValue }.map(\.calories).reduce(0, +)
    }

    var totalCalories: Int {
        logsForScope.map(\.calories).reduce(0, +)
    }

    var totalProtein: Double {
        logsForScope.reduce(0) { $0 + $1.protein }
    }

    var totalSugar: Double {
        logsForScope.reduce(0) { $0 + $1.sugar }
    }

    var totalSaturatedFat: Double {
        logsForScope.reduce(0) { $0 + $1.saturatedFat }
    }

    var totalSodium: Int {
        logsForScope.reduce(0) { $0 + $1.sodium }
    }

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color.green.opacity(0.3),
                    Color.mint.opacity(0.15)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            List {
                Section {
                     VStack(alignment: .leading, spacing: 10) {

                         Text("Today's Nutrition")
                             .font(.title2)
                             .bold()

                         Text("Calories: \(totalCalories) kcal")
                         Text(String(format: "Protein: %.1f g", totalProtein))
                         Text(String(format: "Saturated Fat: %.1f g", totalSaturatedFat))
                         Text(String(format: "Sugar: %.1f g", totalSugar))
                         Text("Sodium: \(totalSodium) mg")
                     }
                     .padding()
                     .background(.ultraThinMaterial)
                     .cornerRadius(12)
                }
                Section {
                    Picker("Show", selection: $scope) {
                        ForEach(Scope.allCases) { s in
                            Text(s.rawValue).tag(s)
                        }
                    }
                    .pickerStyle(.segmented)
                    .listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))

                    Picker("Meal", selection: $selectedMeal) {
                        ForEach(MealType.allCases) { meal in
                            Text(meal.rawValue).tag(meal)
                        }
                    }
                    .pickerStyle(.segmented)
                    .listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))

                    Text("\(selectedMeal.rawValue): \(caloriesForMeal(selectedMeal)) Cal")
                        .foregroundStyle(.blue)

                    Chart {
                        ForEach(MealType.allCases) { meal in
                            BarMark(
                                x: .value("Meal", meal.rawValue),
                                y: .value("Calories", caloriesForMeal(meal))
                            )
                            .foregroundStyle(by: .value("Meal", meal.rawValue))
                        }
                    }
                    .frame(height: 160)
                }

                Section("\(selectedMeal.rawValue) Log") {
                    if mealLogs.isEmpty {
                        Text("No foods logged yet. Tap + on a food below.")
                            .foregroundStyle(.secondary)
                    } else {
                        ForEach(mealLogs) { item in
                            HStack {
                                Text(item.name)
                                Spacer()
                                Text("\(item.calories) Cal")
                                    .foregroundStyle(.orange)
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }
                }

                Section("Add from \(group)") {
                    ForEach(filteredFoods) { food in
                        HStack {
                            NavigationLink {
                                FoodDetailView(food: food, meal: selectedMeal) { addFood($0) }
                            } label: {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(food.name)
                                        .font(.headline)
                                    Text("\(food.calories) Cal")
                                        .foregroundStyle(.orange)
                                }
                            }

                            Button {
                                addFood(food)
                            } label: {
                                Image(systemName: "plus.circle.fill")
                                    .font(.title2)
                                    .foregroundStyle(.green)
                            }
                            .buttonStyle(.borderless)
                            .accessibilityLabel("Add \(food.name) to \(selectedMeal.rawValue)")
                        }
                    }
                }
            }
            .listRowBackground(Color.clear)
            .scrollContentBackground(.hidden)
        }
        .navigationTitle(group)
        .searchable(text: $searchText, prompt: "Search \(group)")
        .alert("Added", isPresented: Binding(
            get: { addedMessage != nil },
            set: { if !$0 { addedMessage = nil } }
        )) {
            Button("OK", role: .cancel) { addedMessage = nil }
        } message: {
            Text(addedMessage ?? "")
        }
       .toolbar {
            EditButton()
        }
    }

private func addFood(_ food: FoodItem) {
        let item = FoodLogItem(
            name: food.name,
            calories: food.calories,
            protein: food.protein,
            saturatedFat: food.saturatedFat,
            sugar: food.sugar,
            sodium: food.sodium,
            meal: selectedMeal.rawValue
        )

        context.insert(item)

        do {
            try context.save(); print("✅ Added \(food.name)")
            print("Total saved foods: \(logs.count)")

            addedMessage = "\(food.name) added to \(selectedMeal.rawValue)"

        } catch {
            print("❌ SwiftData save error: \(error)")
        }
    }

    func deleteItems(at offsets: IndexSet) {
        for index in offsets {
            context.delete(mealLogs[index])
        }
    }
}

// MARK: - Food Detail

struct FoodDetailView: View {
    let food: FoodItem
    let meal: MealType
    let onAdd: (FoodItem) -> Void

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color.green.opacity(0.3),
                    Color.mint.opacity(0.15)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            List {
                Section {
                    Text(food.name)
                        .font(.title2)
                        .bold()
                    Text("\(food.calories) Cal")
                        .font(.title3)
                        .foregroundStyle(.orange)
                    Text("Food group: \(food.foodGroup)")
                        .foregroundStyle(.secondary)
                }

                Section("Healthy tips") {
                    ForEach(healthyTips(for: food), id: \.self) { tip in
                        Label(tip, systemImage: "leaf.fill")
                            .foregroundStyle(.green)
                    }
                }

                Section {
                    Button {
                        onAdd(food)
                        dismiss()
                    } label: {
                        Label("Add to \(meal.rawValue)", systemImage: "plus.circle.fill")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.green)
                }
            }
            .scrollContentBackground(.hidden)
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: FoodLogItem.self, inMemory: true)
}

