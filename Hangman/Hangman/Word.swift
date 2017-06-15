//
//  Word.swift
//  Hangman
//
//  Created by Chinnawat Ong-art on 6/15/2560 BE.
//  Copyright © 2560 SmilyDog. All rights reserved.
//

import Foundation
import SwiftyJSON
class Word{
    var wordList:[String] = []
    var api:RestfulAPIManager
    init(){
        
        api = RestfulAPIManager()
        api.getWordFromServer { (res, error) in
            if(error != nil){
                print(error)
            }
            else{
                if let data = res{
                    let json = JSON(data:data)
                    for word in json.array!{
                        self.wordList.append(word.string!)
                    }
                }
            }
        }
    }
}
