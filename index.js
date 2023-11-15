var express = require('express');
var cors = require('cors');
var app = express();
var port = process.env.PORT || 8787;
app.use(express.json());
app.use(cors());
app.get('/', function (req, res) {
    return res.send('Hellow');
});
var server = app.listen(port, function () {
    console.log("Server is listening at http://localhost:".concat(port));
});
