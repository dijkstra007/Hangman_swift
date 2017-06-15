var app = require('express')();
var port = process.env.PORT || 7777;
var users = require('./src/User');
var wordList = require('./src/WordList');
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

app.listen(port,function(){
    console.log('Starting node.js on port '+port);
});
