//
//  RESTFUL_API_MANAGER.swift
//  Hangman
//
//  Created by Chinnawat Ong-art on 6/14/2560 BE.
//  Copyright © 2560 SmilyDog. All rights reserved.
//

import Foundation
import Alamofire
class RestfulAPIManager{
    static var shared = RestfulAPIManager()
    let url = "http://localhost:7777/wordList"
    var word:String = ""
    init() {
        
    }
    func getWordFromServer(completionHandler: @escaping (Data?,Error?) -> Void){
        Alamofire.request(url).responseData { (response) in
            completionHandler(response.result.value,response.result.error)
           
        }
    }
    
}
