var urlImageList = [
    "http://localhost:3000/img/1/1.png",
    "http://localhost:3000/img/1/2.png",
    "http://localhost:3000/img/1/3.png",
    "http://localhost:3000/img/1/4.png",
    "http://localhost:3000/img/1/5.png",
    "http://localhost:3000/img/1/6.png",
    "http://localhost:3000/img/1/7.png",
    "http://localhost:3000/img/1/8.png",
    "http://localhost:3000/img/1/9.png",
    "http://localhost:3000/img/1/10.png"
    
]

exports.getImageList = function(){
    let arr = []
    let obj;
    for(let i=0;i<urlImageList.length ;i++){
        obj = {}
        obj.id = i+1
        obj.url = urlImageList[i]
        arr.push(obj)
    }
    return arr;
}
