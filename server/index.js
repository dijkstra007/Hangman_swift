var express = require('express');
var app = require('express')();
var path = require('path');
var port = process.env.PORT || 7777;
var users = require('./src/User');
var wordList = require('./src/WordList');
var imgHangman = require('./src/imgHangman');


app.set('port',3000);
app.use(express.static(path.join(__dirname,'public')));

var server = app.listen(app.get('port'),function(){
    var port = server.address().port;
    console.log("Magic happens on port"+port);
})

app.get('/',function(req,res){
    res.send('<h1>Hello Node.js</h1>');
});
app.get('/index',function(req,res){
    res.send('<h1>This is index page');
});
app.get('/firstUser',function(req,res){
    res.json(users.getFirstUser());
});
app.get('/allUser',function(req,res){
    res.json(users.findAll());
});
app.get('/wordList',function(req,res){
    res.json(wordList.getWordList());
});
app.get('/hangmanImgURL/1',function(req,res){
    res.json(imgHangman.getImageList());
});

app.listen(port,function(){
    console.log('Starting node.js on port '+port);
});
