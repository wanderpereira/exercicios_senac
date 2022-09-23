import express from 'express';
const app = express();
app.get('/', (req, res) => {
    let resultado = (parseInt(req.query.n1)+parseInt(req.query.n2))%2 == 0 ? "Par" : "Impar";
    return res.send(resultado);
});
app.listen(3000);