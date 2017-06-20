//: Playground - noun: a place where people can play

import UIKit

var obj = Dictionary<String,String>()
var str = "champ"
var  c = "h"
var label:String = ""

for (index,val) in str.characters.enumerated() {
    if(index != str.characters.count-1){
        label = label + String(val) + " "
    }
    else{
        label = label + String(val)
    }
}

var temp:String = ""
var index = 3
for (i,char) in str.characters.enumerated() {
    if i == index {
        temp = temp + c
    }
    else {
        temp = temp + String(char)
    }
}
str = temp
print(str)
