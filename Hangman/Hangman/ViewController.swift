//
//  ViewController.swift
//  Hangman
//
//  Created by Chinnawat Ong-art on 6/14/2560 BE.
//  Copyright © 2560 SmilyDog. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var textInput: UITextField!
    
    var wordList:[String]?
    var imgHangmanList:[Int:UIImage]?
    @IBOutlet weak var hangmanUIImageView: UIImageView!
    var word:String = ""
    var imgIndex = 1
    var correctCount:Int = 0
    var isWin:Bool = false
    var guessWord = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let word = Word()
        let imgHangman = ImgHangman();
        word.getWordList(completionHandler: { (list) in
            if let list_word = list {
                self.wordList = list_word
            }
        })
       imgHangman.getImageList { (imgList) in
            if let imgLists = imgList {
                self.imgHangmanList = imgLists
                self.initGame()
            }
        
        }
        
    }
    @IBAction func didTapOnGuessButton(_ sender: Any) {
        guard isWin == false else{
            self.initGame()
            return
        }
        let text = textInput.text!.lowercased()
        if text.characters.count == 1 {
            var indexList = findIndexListOf(str: word, char: text)
            print(indexList)
            if(!indexList.isEmpty){
                for (i,index) in indexList.enumerated() {
                    correctCount = correctCount + 1
                    guessWord = changeStringAt(index: index, str: guessWord,c:text)
                    updateLabel(text: guessWord)
                    if(correctCount==word.characters.count){
                        isWin = true
                        self.win()
                    }
                }
                
            }
            else{
                nextImage()
            }
        }
    }
    func initGame(){
        hangmanUIImageView.image  = nil
        correctCount = 0
        imgIndex = 1
        isWin=false
        guessWord = ""
        let index = randomInt(min: 0, max: (wordList?.count)!-1)
        word = wordList![index]
        for i in 0..<word.characters.count {
            guessWord = guessWord + "_"
        }
        print(word)
        updateLabel(text: guessWord)
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    func nextImage() {
        imgIndex = imgIndex+1
        if(imgIndex > 10){
            imgIndex = 1
            gameOver()
        }
        self.hangmanUIImageView.image = imgHangmanList?[imgIndex]
        
    }
    
    func gameOver(){
        print("Game Over")
        initGame();
    }
    func win(){
        print("Win")
    }
    func randomInt(min: Int, max:Int) -> Int {
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
    }
    func findIndexListOf(str:String,char:String)->[Int]{
        let c = char
        var list:[Int] = []
        for (index,element) in str.characters.enumerated() {
            if c.characters.first == element {
                list.append(index)
            }
        }
        return list
    }
    func updateLabel(text:String){
        var label:String = ""
        
        for (index,val) in text.characters.enumerated() {
            if(index != text.characters.count-1){
                label = label + String(val) + " "
            }
            else{
                label = label + String(val)
            }
        }
        print(label)
        self.wordLabel.text = label
    }
    func changeStringAt(index:Int,str:String,c:String)->String{
        var temp:String = ""
        for (i,char) in str.characters.enumerated() {
            if i == index {
                temp = temp + c
            }
            else {
                temp = temp + String(char)
            }
        }
        return temp
    }
}

