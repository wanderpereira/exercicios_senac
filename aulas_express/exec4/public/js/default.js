let port = document.cookie.substring(5);

console.log(port);

function GeraCalculo(){
    let rendimento = document.getElementById("rendimento").value;
    let irretido = document.getElementById("irretido").value;
    let dependentes = document.getElementById("dependentes").value;
    let saude = document.getElementById("saude").value;
    let educacao = document.getElementById("educacao").value;
    const data = {rendimento: rendimento, irretido: irretido, dependentes: dependentes, saude: saude, educacao: educacao}
    

    fetch(`http://localhost:${port}/recebe`, {
        method: "POST",
        headers: {
            'Accept': 'application/json, text/plain, */*',
            "Content-Type": "application/json",
        },
        body: JSON.stringify(data),
    })
    .then((response) => response.json())
    .then((data) => {
        document.getElementById("resultado").innerHTML = data;
        console.log("Success:", data)
    })
    .catch((error) => {
        console.log("Error:", error)
    })
}