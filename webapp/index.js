var express = require('express');
var app = express();
var router = express.Router();
var path = __dirname + '/';

app.use(express.static(path));
router.use(function(req, res, next) {
    console.log("/" + req.method);
    next();
});

router.get("/", function(req, res) {
    res.sendFile(path + "index.html");
});

router.get("/tester", function(req, res) {
    res.sendFile(path + "tester.html");
});

app.use("/", router);
var listener = app.listen(10001, function() {
    console.log("Listening on port: " + listener.address().port);
});
