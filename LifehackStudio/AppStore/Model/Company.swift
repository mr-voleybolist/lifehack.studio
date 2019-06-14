//
//  Company.swift
//  LifehackStudio
//
//  Created by Денис Лапшин on 11/06/2019.
//  Copyright © 2019 Денис Лапшин. All rights reserved.
//

import Foundation
import RealmSwift

open class Company: Object {
    
    @objc dynamic var id: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var descriptionText: String = ""
    
    static func construct(id: String, name: String, descriptionText: String = "") -> Company {
        let company = Company()
        company.id = id
        company.name = name
        company.descriptionText = descriptionText
        return company
    }
    
    override open class func primaryKey() -> String? {
        return "id"
    }
    
}
