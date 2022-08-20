class Contato {
  final int id;
  String nome;
  int numeroConta;

  Contato(this.id, this.nome, this.numeroConta,);

  String getNome() {
    return nome;
  }

  void setNome(String nome) {
    this.nome = nome;
  }

  int getNumeroConta() {
    return numeroConta;
  }

  void setNumeroConta(int numeroConta) {
    this.numeroConta = numeroConta;
  }

  @override
  String toString() {
    return 'Contato{id: $id, nome: $nome, numeroConta: $numeroConta}';
  }
}