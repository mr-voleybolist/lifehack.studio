//
//  NetworkManager.swift
//  LifehackStudio
//
//  Created by Денис Лапшин on 11/06/2019.
//  Copyright © 2019 Денис Лапшин. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    static let BACKEND_URL = "http://megakohz.bget.ru/test.php"
    
    func loadСompanies(callback: @escaping ([Any]) -> (), errorCallback: @escaping () -> ()) {
        request(NetworkManager.BACKEND_URL).responseJSON {
            (response) in
            if let json = response.result.value as? [Any] {
                callback(json)
            } else {
                errorCallback()
            }
        }
    }
    
    func loadСompany(byId id: Int, callback: @escaping ([Any]) -> (), errorCallback: @escaping () -> ()) {
        let urlString = NetworkManager.BACKEND_URL + "?id=\(id)"
        guard let url = URL(string: urlString) else {return}
        
        request(url).responseJSON {
            (response) in
            if let json = response.result.value as? [Any] {
                callback(json)
            } else {
                errorCallback()
            }
        }
    }
}
