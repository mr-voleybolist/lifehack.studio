//
//  DBManager.swift
//  LifehackStudio
//
//  Created by Денис Лапшин on 11/06/2019.
//  Copyright © 2019 Денис Лапшин. All rights reserved.
//

import Foundation
import RealmSwift

open class DBManager {
    
    public static let shared = DBManager()
    var realm: Realm!
    private init() {
        let config = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
        Realm.Configuration.defaultConfiguration = config
        do {
            realm = try Realm()
        } catch {
            ErrorHandler.shared.handle(error: error.localizedDescription)
        }
    }
    
    func loadObjects<T>(type: T.Type) -> [T] {
        return Array(realm.objects(type as! Object.Type)) as! [T]
    }
    
    open func persistObject(object: Object) {
        do {
            try realm.write {
                if type(of: object).primaryKey() != nil {
                    realm.add(object, update: true)
                } else {
                    realm.add(object)
                }
            }
        } catch {
            ErrorHandler.shared.handle(error: error.localizedDescription)
        }
    }
    
    open func persistObjects(objects: [Object]) {
        do {
            try realm.write {
                for object in objects {
                    if type(of: object).primaryKey() != nil {
                        realm.add(object, update: true)
                    } else {
                        realm.add(object)
                    }
                }
            }
        } catch {
            ErrorHandler.shared.handle(error: error as! String)
        }
    }
    
    func findObjects<T>(type: T.Type, format: String) -> [T] {
        return Array(realm.objects(type as! Object.Type).filter(NSPredicate(format: format))) as! [T]
    }
    
    func allObjects<T>(type: T.Type) -> [T] {
        return Array(realm.objects(type as! Object.Type)) as! [T]
    }
    
    func updateObjects<T>(objects: [Object], type: T.Type) {
        do {
            try realm.write {
                realm.delete(realm.objects(type as! Object.Type))
                
                realm.add(objects)
            }
        } catch {
            ErrorHandler.shared.handle(error: error.localizedDescription)
        }
    }
    
    func deleteObjects(objects: [Object]) {
        do {
            try realm.write {
                for object in objects {
                    realm.delete(object)
                }
            }
        } catch {
            ErrorHandler.shared.handle(error: error.localizedDescription)
        }
    }
}

