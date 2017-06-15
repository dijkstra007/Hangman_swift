
var fs = require('fs');
var array = fs.readFileSync('./server/wordList.txt').toString().split("\n");
for(i in array) {
    console.log(array[i]);
}

exports.getFirstWord = function(){
    
    return array[0];
}
exports.getWordList = function(){
    return array;
}
