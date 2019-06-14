//
//  ErrorHandler.swift
//  LifehackStudio
//
//  Created by Денис Лапшин on 11/06/2019.
//  Copyright © 2019 Денис Лапшин. All rights reserved.
//

import Foundation

open class ErrorHandler {
    static let shared = ErrorHandler()
    private init() {}
    
    func handle(error: String) {
        print("error handler called")
        print(error)
    }
    
    func handle(error: Error) {
        print("error handler called")
        print(error)
    }
    
}
