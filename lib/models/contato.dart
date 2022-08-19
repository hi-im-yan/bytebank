class Contato {
  final int id;
  String? nome;
  int? numeroConta;

  Contato(this.id, this.nome, this.numeroConta,);

  @override
  String toString() {
    return 'Contato{id: $id, nome: $nome, numeroConta: $numeroConta}';
  }
}