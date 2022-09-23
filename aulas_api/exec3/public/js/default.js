function Insere(){
    let nome = document.getElementById("nome").value;
    let idade = document.getElementById("idade").value;
    let telefone = document.getElementById("telefone").value;
    let email = document.getElementById("email").value;
    const data = {name: nome, age: idade, phone: telefone, email: email}
    fetch("http://localhost:3000/recebe", {
        method: "POST",
        headers: {
            'Accept': 'application/json, text/plain, */*',
            "Content-Type": "application/json",
        },
        body: JSON.stringify(data),
    })
    .then((response) => response.json())
    .then((data) => {
        console.log("Success:", data())
    })
    .catch((error) => {
        console.log("Error:", error)
    })
}