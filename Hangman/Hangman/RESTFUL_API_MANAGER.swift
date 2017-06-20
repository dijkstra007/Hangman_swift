//
//  RESTFUL_API_MANAGER.swift
//  Hangman
//
//  Created by Chinnawat Ong-art on 6/14/2560 BE.
//  Copyright © 2560 SmilyDog. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage

class RestfulAPIManager{
    static var shared = RestfulAPIManager()
    let url = "http://localhost:7777"
    var word:String = ""
    init() {
        
    }
    func getWordFromServer(completionHandler: @escaping (Data?,Error?) -> Void){
        Alamofire.request(url+"/wordList").responseData { (response) in
            completionHandler(response.result.value,response.result.error)
           
        }
    }
    func getImageURLList(completionHandler: @escaping (Data?,Error?)->Void){
        Alamofire.request(url+"/hangmanImgURL/1").responseData{ (response) in
            completionHandler(response.result.value,response.result.error);
        }
    }
    func getUIImageFromURL(url:String,completionHandler: @escaping (UIImage?)->Void){
        Alamofire.request(url).responseImage { (response) in
            if let image = response.result.value {
                completionHandler(image)
            }
            else{
                completionHandler(nil)
            }
            
        }
    }
    
}
