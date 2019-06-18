//instead of const we can use eigther var or let,but this is for http n we wont change it,so using const
//require() using to import file (filename) or path(./filename) or module(modulename)
const http = require('http'); 
const fs = require('fs');
//in createServer a request listener is an argument : its a function that will execute every incoming request,
//so fst create that function 
//fst parameter should be request n secnd is response

    /*function rqListener(req, res){

    }*/

// we can call the created function in different methods
//method 1 : just add the function name
    /*http.createServer(rqListener);*/

//method 2 : if u are not created the function,u can also use so called ANONYMOUS function

    /*http.createServer(function(req, res){

    });*/

//method 3 : use arrow function

//this is (any of these 3 methods) our create serevr calback function

const server = http.createServer((req, res) => {
    //console.log(req.url, req.method, req.headers);

    /*fs.writeFileSync('message.txt','DUMMy');
    res,statusCode =302;
    res.setHeader('Location' ,'/message');
    return res.end();*/

    res.setHeader('Content-Type' ,'text/html');
    res.write('<html>');
    res.write('<head><title>My First Page</title></head>');
    res.write('<body> <h1> Hello From my node.js Server!</h1></body>');
    res.write('</html>');
    res.end();
});
//listen(port,number,hostname)
server.listen(3000);