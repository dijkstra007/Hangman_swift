//
//  ImgHangman.swift
//  Hangman
//
//  Created by Chinnawat Ong-art on 6/19/2560 BE.
//  Copyright © 2560 SmilyDog. All rights reserved.
//

import Foundation
import SwiftyJSON
protocol ImgHangmanDelegate {
    func didImageDownload(sender: AnyObject)
}
class ImgHangman{
    var urlImageList = Dictionary<Int,String>()
    var api:RestfulAPIManager?
    var imgList = Dictionary<Int,UIImage>()
    var delegate: ImgHangmanDelegate?
    init(){
        
    }
    func getImageList(completionHandler: @escaping ([Int:UIImage]?)->Void){
        api = RestfulAPIManager()
        api?.getImageURLList(completionHandler: { (response, error) in
            if(error != nil){
                print(error)
                completionHandler(nil)
            }
            else{
                if let data = response {
                    let json = JSON(data:data)
                    for (index,element) in json.enumerated() {
                        let id = json[index]["id"].int
                        let value = json[index]["url"].string
                        self.urlImageList[id!] = value
                    }
                    self._getUIImageListFromUrlList(completionHandler: completionHandler)
             }
                else{
                    completionHandler(nil)
                }
            }
        })
    }
    func _getUIImageListFromUrlList(completionHandler: @escaping ([Int:UIImage]?)->Void){
        for (id,val) in self.urlImageList {
            api?.getUIImageFromURL(url: val, completionHandler: { (img) in
                if let image = img {
                    self.imgList[id] = image

                }
                if self.imgList.count == self.urlImageList.count {
                    completionHandler(self.imgList)
                }
                    
            })
        }
    }
}
