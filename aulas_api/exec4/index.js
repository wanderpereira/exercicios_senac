import express from "express";
import path from "path"
import cors from "cors"
import bodyParser from "body-parser"
import {calcula} from "./Calculo.js";

const app = express();
const port = 81;
const __dirname = path.resolve();

app.use(cors({
    origin: '*'
}));

app.use(bodyParser.json())

app.get('/', function (req, res) {
    res.sendFile(path.join(__dirname, 'public', 'index.html'))
    res.cookie('port', port)
})

app.get('/js/', function (req, res) {
    res.sendFile(path.join(__dirname, 'public/js', 'default.js'))
})

app.post('/recebe', function (req, res) {
    const {rendimento, irretido, dependentes, saude, educacao} = req.body;

    res.json(calcula(rendimento, irretido, dependentes, saude, educacao))
})


app.listen(port);
console.log('Servidor rodando em http://localhost:' + port);

