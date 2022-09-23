// Esperando a porta do servidor
let port = document.cookie.substring(5);

function adicionar() {
  form.className += "hidden";
  add.className -= "hidden";
}

function pesquisar() {
  form.className += "hidden";
  search.className -= "hidden";
}

function voltar() {
  document.location.reload(true);
}

function salvar() {
  const data = {
    nome: document.getElementsByName("nome")[0].value,
    idade: document.getElementsByName("idade")[0].value,
    telefone: document.getElementsByName("telefone")[0].value,
  };

  fetch(`http://localhost:${port}/`, {
    method: "POST",
    headers: {
      Accept: "application/json, text/plain, */*",
      "Content-Type": "application/json",
    },
    body: JSON.stringify(data),
  })
    .then((response) => response.json()) // Resposta da API
    .then((data) => {
      alert(data);
    })
    .catch((error) => {
      console.log("Error:", error);
    });
}

function busca_idade() {
  const idade = prompt("Informe uma Idade:");

  const data = {
    idade: idade,
  };

  fetch(`http://localhost:${port}/buscagem`, {
    method: "POST",
    headers: {
      Accept: "application/json, text/plain, */*",
      "Content-Type": "application/json",
    },
    body: JSON.stringify(data),
  })
    .then((response) => response.json()) // Resposta da API
    .then((data) => {
      if (data === "Nada Encontrado!") {
        alert(data);
      } else {
        document.getElementById("method").innerHTML =
          "Sua busca solicitada pela Idade";
        document.getElementById("response").innerHTML = data
          .map(
            (resp) =>
              `
            <tr>
            <td class="p-2 whitespace-nowrap">
                <div class="flex items-center">
                  <div class="font-medium text-gray-800">${resp.nome}</div>
                </div>
              </td>
              <td class="p-2 whitespace-nowrap">
                <div class="text-left">${resp.idade}</div>
              </td>
              <td class="p-2">
                <div class="text-left font-medium text-green-500">${resp.telefone}</div>
              </td>
            </tr>
          `
          )
          .join("");
        container.className += " hidden";
        search.className += " hidden";
        table.className -= "hidden";
        table.className -= "NaN";
        table.className +=
          "text-gray-600 h-screen relative px-10 pt-10 pb-10 sm:mx-auto sm:max-w-lg sm:px-1";
      }
    })
    .catch((error) => {
      console.log("Error:", error);
    });
}

function busca_nome() {
  const nome = prompt("Informe um Nome:");

  const data = {
    nome: nome,
  };

  fetch(`http://localhost:${port}/buscagem`, {
    method: "POST",
    headers: {
      Accept: "application/json, text/plain, */*",
      "Content-Type": "application/json",
    },
    body: JSON.stringify(data),
  })
    .then((response) => response.json()) // Resposta da API
    .then((data) => {
      console.log(data)
      if (data === "Nada Encontrado!") {
        alert(data);
      } else {
        document.getElementById("method").innerHTML =
          "Sua busca solicitada por Nome";
        document.getElementById("response").innerHTML = data
          .map(
            (resp) =>
              `
            <tr>
            <td class="p-2 whitespace-nowrap">
                <div class="flex items-center">
                  <div class="font-medium text-gray-800">${resp.nome}</div>
                </div>
              </td>
              <td class="p-2 whitespace-nowrap">
                <div class="text-left">${resp.idade}</div>
              </td>
              <td class="p-2">
                <div class="text-left font-medium text-green-500">${resp.telefone}</div>
              </td>
            </tr>
          `
          )
          .join("");
        container.className += " hidden";
        search.className += " hidden";
        table.className -= "hidden";
        table.className -= "NaN";
        table.className +=
          "text-gray-600 h-screen relative px-10 pt-10 pb-10 sm:mx-auto sm:max-w-lg sm:px-1";
      }
    })
    .catch((error) => {
      console.log("Error:", error);
    });
}