//
//  RecipesResponse.swift
//  Reciplease
//
//  Created by Damien Rojo on 21.03.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import Foundation

// MARK: - RecipesResponse
struct RecipesResponse: Codable, Equatable {
    let q: String
    let from, to: Int
    let more: Bool
    let count: Int
    let hits: [Hit]

    // MARK: - Hit
    struct Hit: Codable, Equatable {
        let recipe: Recipe
        let bookmarked, bought: Bool
    }
    
    // MARK: - Recipe
    struct Recipe: Codable, Equatable {
        let uri: String
        let label: String
        let image: String
        let source: String
        let url: String
        let shareAs: String
        let yield: Int
        let dietLabels: [String]
        let healthLabels: [String]
        let cautions: [String]
        let ingredientLines: [String]
        let ingredients: [Ingredient]
        let calories, totalWeight: Double
        let totalTime: Int
        let totalNutrients, totalDaily: [String: Total]
        let digest: [Digest]
    }
    
//    enum Caution: String, Codable {
//        case fodmap = "FODMAP"
//        case sulfites = "Sulfites"
//    }
    
    // MARK: - Digest
    struct Digest: Codable, Equatable {
        let label, tag: String
        let schemaOrgTag: SchemaOrgTag?
        let total: Double
        let hasRDI: Bool
        let daily: Double
        let unit: Unit
        let sub: [Digest]?
    }
    
    enum SchemaOrgTag: String, Codable, Equatable {
        case carbohydrateContent = "carbohydrateContent"
        case cholesterolContent = "cholesterolContent"
        case fatContent = "fatContent"
        case fiberContent = "fiberContent"
        case proteinContent = "proteinContent"
        case saturatedFatContent = "saturatedFatContent"
        case sodiumContent = "sodiumContent"
        case sugarContent = "sugarContent"
        case transFatContent = "transFatContent"
    }

    enum Unit: String, Codable, Equatable {
        case empty = "%"
        case g = "g"
        case kcal = "kcal"
        case mg = "mg"
        case µg = "µg"
    }

    enum HealthLabel: String, Codable, Equatable {
        case alcoholFree = "Alcohol-Free"
        case immunoSupportive = "Immuno-Supportive"
        case peanutFree = "Peanut-Free"
        case sugarConscious = "Sugar-Conscious"
        case treeNutFree = "Tree-Nut-Free"
    }

    // MARK: - Ingredient
    struct Ingredient: Codable, Equatable {
        let text: String
        let weight: Double
        let image: String?
    }

    // MARK: - Total
    struct Total: Codable, Equatable {
        let label: String
        let quantity: Double
        let unit: Unit
    }
}
