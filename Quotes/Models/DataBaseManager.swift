//
//  DataBaseManager.swift
//  Quotes
//
//  Created by Afnan Ahmed on 12/12/2023.
//

import Foundation
import UIKit
import CoreData

@available(iOS 13.0, *)
class DataBaseManager {
    
    private var context: NSManagedObjectContext {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    func addQoute(title: String, Discription: String, Favorite: Bool)
    {
        let userQoute = Quote(context: context)
        userQoute.quoteTitle = title
        userQoute.quoteDiscription = Discription
        userQoute.quoteFavoriote = Favorite
        
        do {
            try context.save()
        }catch {
            print("User Saving Error", error)
        }
    }
    
    func updateQoute(title: String, Discription: String, Favorite: Bool, userQoute: Quote)
    {
        userQoute.quoteTitle = title
        userQoute.quoteDiscription = Discription
        userQoute.quoteFavoriote = Favorite
        do {
            try context.save()
        }catch {
            print("User Saving Error", error)
        }
    }
    
    func fetchQuotes() -> [Quote] {
        var quotes: [Quote] = []
        
        do {
            quotes = try context.fetch(Quote.fetchRequest())
            
        }catch {
            print("Fetch Error", error)
        }
        
        return quotes
    }
}
