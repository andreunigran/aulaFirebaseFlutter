class Cliente {
  String nome;
  int idade;
  Cliente({required this.idade, required this.nome});

  Map<String, dynamic> get toMap =>
      <String, dynamic>{"nome": nome, "idade": idade};
}
