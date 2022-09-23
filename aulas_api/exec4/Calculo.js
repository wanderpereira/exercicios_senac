/*
obs:
se o resultado for negativo então deverá receber o imposto, 
caso positivo deverá pagar o imposto
*/

function calcula(rendimento, irretido, dependentes, saude, educacao) {

    let resultado = (dependentes * 300) + Number(saude) + Number(educacao) + Number(irretido)

    if (rendimento <= 30000) {
        return irretido > 0 ? "Receberá o valor de: R$ " + irretido : "Isento"
    }
    else if (rendimento > 30000 || rendimento < 60000) {
        let percentual = (rendimento * (10 / 100))
        let total = percentual - resultado;
        
        return Math.sign(total) < 0 ? "Receberá o valor de: R$ " + Math.abs(total) : "Pagará o valor de: " + total
    }
    else if (rendimento > 60000 || rendimento < 100000) {
        let percentual = (rendimento * (20 / 100))
        let total = percentual - resultado

        return Math.sign(total) < 0 ? "Receberá o valor de: R$ " + Math.abs(total) : "Pagará o valor de: " + total
    }
    else if (rendimento >= 100000) {
        let percentual = (rendimento * (30 / 100))
        let total = percentual - resultado

        return Math.sign(total) < 0 ? "Receberá o valor de: R$ " + Math.abs(total) : "Pagará o valor de: " + total
    }
    else {
        return "Nenhum dado foi calculado"
    }
}

export { calcula }