//
//  CoredataStack.swift
//  Reciplease
//
//  Created by Damien Rojo on 08.04.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import Foundation
import CoreData

final class CoredataStack {

    lazy var context = persistentContainer.viewContext
    
    // MARK: - Core Data stack
    
    private lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "Reciplease")
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext(for recipe: Recipe) {
        let context = persistentContainer.viewContext
        let save = NSEntityDescription.insertNewObject(forEntityName: "RecipeEntity", into: context)
        save.setValue(recipe.url, forKey: "id")
        save.setValue(recipe.title, forKey: "title")
        save.setValue(recipe.originalRecipeURL, forKey: "url")
        save.setValue(recipe.totalTime, forKey: "totalTime")
        save.setValue(recipe.ingredientLines, forKey: "ingredients")
        save.setValue(recipe.imageTextURL, forKey: "imageURL")
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func someEntityExists(id: String) -> Bool {
        let fetchRequest: NSFetchRequest<RecipeEntity> = RecipeEntity.fetchRequest()
        var result: [RecipeEntity] = []
        do {
            result = try context.fetch(fetchRequest)
        } catch {}
        return result.contains(where: { $0.id == id })
    }
    
    func deleteAllRecords() {
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "RecipeEntity")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)

        do {
            try context.execute(deleteRequest)
            try context.save()
        } catch {
            print ("There was an error")
        }
    }
}

final class QuerySet<T: NSManagedObject> {
    private let context: NSManagedObjectContext
    private let underlyingFetchRequest: NSFetchRequest<T>
    

    init(context: NSManagedObjectContext) {
        self.context = context
        self.underlyingFetchRequest = NSFetchRequest(
            entityName:String(describing:  T.self)
        )
        self.underlyingFetchRequest.returnsObjectsAsFaults = false // Joker
    }

    var all: [T] {
        let fetchRequest = toFetchRequest()
        if fetchRequest.propertiesToFetch?.count ?? 0 > 0
        || fetchRequest.propertiesToGroupBy?.count ?? 0 > 0
        || fetchRequest.resultType != NSFetchRequestResultType() {
            fatalError("You couldn't use .all with this configuration. Please use fetchAs() instead.")
        }
        do {
            let results = try context.fetch(fetchRequest)
            return results
        } catch {
            return []
        }
    }

    func toFetchRequest() -> NSFetchRequest<T> {
        let fetchRequest = underlyingFetchRequest.copy() as! NSFetchRequest<T>
        fetchRequest.fetchBatchSize = underlyingFetchRequest.fetchBatchSize
        return fetchRequest
    }
 }
