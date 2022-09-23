class LocalStorage {
  constructor() {
    this.values = [];
  }

  guardar(dados) {
    this.values.push(dados);
    console.log(dados);
  }

  consultar(dados) {
    const result =
      dados.nome == null
        ? this.values.filter((busca) => busca.idade === dados.idade)
        : this.values.filter((busca) => busca.nome === dados.nome);
    return result.length > 0 ? result : "Nada Encontrado!";
  }
}

export const localstorage = new LocalStorage();