import express from 'express';
const app = express();
app.get('/', (req, res) => {
    switch(req.query.opcao) {
        case '1':
           res.send("Soma: " + (Number(req.query.n1) + Number(req.query.n2)));
          break;
        case '2':
           res.send("Multiplicação: " + (Number(req.query.n1) * Number(req.query.n2)))
          break;
        case '3':
            res.send("Subtração: " + (Number(req.query.n1) - Number(req.query.n2)))
            case '4':
                res.send("Divisão: " + (Number(req.query.n1) / Number(req.query.n2)))
        default:
             res.send("None of")
    }
});
app.listen(3000);