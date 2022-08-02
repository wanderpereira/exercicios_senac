import express from "express";
import path from "path"
import cors from "cors"
import bodyParser from "body-parser"
import {localstorage} from './localstorage.js'

const app = express();
const port = 8080;
const __dirname = path.resolve();

app.use(cors({
    origin: '*'
}));

app.use(bodyParser.json())

app.get('/', function (req, res) {
    res.sendFile(path.join(__dirname, 'public', 'index.html'))
    res.cookie('port', port)
})

app.get('/js', function (req, res) {
    res.sendFile(path.join(__dirname, 'public/js', 'default.js'))
})

app.post('/', (req, res) => {
    const dados = req.body;
    localstorage.guardar(dados)
    res.json("Adicionado com Sucesso :)")
})

app.post('/buscagem', (req, res) => {
    const buscagem = req.body;
    res.json(localstorage.consultar(buscagem))
})


app.listen(port);
console.log('Servidor rodando em http://localhost:' + port);

