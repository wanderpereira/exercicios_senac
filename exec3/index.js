import express from "express";
import path from "path"
import cors from "cors"
import bodyParser from "body-parser"
const app = express();
const port = process.env.PORT || 3000;
const __dirname = path.resolve();

app.use(cors({
    origin: '*'
}));

app.use(bodyParser.json())

app.get('/', function(req, res) {
    res.sendFile(path.join(__dirname ,'public','index.html'))
})

app.get('/js/', function(req, res) {
    res.sendFile(path.join(__dirname ,'public/js','default.js'))
})

app.post('/recebe', function(req, res) {
    const data = []
    data.push({name: req.body.name, age: req.body.age, phone: req.body.phone, email: req.body.email})
    console.table(data)
})

app.listen(port);
console.log('Servidor rodando em http://localhost:' + port);