//
//  CoreDataFeedStore.swift
//  EssentialFeed
//
//  Created by Zeljko Lucic on 23.11.22..
//

import CoreData

public final class CoreDataStore {
    private var container: NSPersistentContainer?
    private var context: NSManagedObjectContext?
    
    public init(storeURL: URL) {
        guard let modelURL = Bundle.main.url(forResource: "DataModel", withExtension: "momd") else {
            print("Failed to find data model")
            return
        }
        
        guard let managedObjectModel = NSManagedObjectModel(contentsOf: modelURL) else {
            print("Failed to create model from file: \(modelURL)")
            return
        }
        
        container = NSPersistentContainer(name: "CoreDataStore", managedObjectModel: managedObjectModel)
        context = container?.newBackgroundContext()
    }
}

public final class CoreDataFeedStore {
    private static let modelName = "FeedStore"
    private static let model = NSManagedObjectModel.with(name: modelName, in: Bundle(for: CoreDataFeedStore.self))
    
    private let container: NSPersistentContainer
    private let context: NSManagedObjectContext
    
    enum StoreError: Error {
        case modelNotFound
        case failedToLoadPersistentContainer(Error)
    }
    
    public init(storeURL: URL) throws {
        guard let model = CoreDataFeedStore.model else {
            throw StoreError.modelNotFound
        }
        
        do {
            container = try NSPersistentContainer.load(name: CoreDataFeedStore.modelName, model: model, url: storeURL)
            context = container.newBackgroundContext()
        } catch {
            throw StoreError.failedToLoadPersistentContainer(error)
        }
    }
    
    func performAsync(_ action: @escaping (NSManagedObjectContext) -> Void) {
        let context = self.context
        context.perform { action(context) }
    }
    
    private func cleanUpReferencesToPersistentStores() {
        context.performAndWait {
            let coordinator = self.container.persistentStoreCoordinator
            try? coordinator.persistentStores.forEach(coordinator.remove)
        }
    }
    
    deinit {
        cleanUpReferencesToPersistentStores()
    }
}
