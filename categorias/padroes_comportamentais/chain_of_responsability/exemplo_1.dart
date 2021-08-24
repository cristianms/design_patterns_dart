/// Lógica de um caixa eletrônico onde é necessário calcular quantas notas de cada valor deve ser
/// entregue ao usuário na hora de um saque. Por exemplo se o usuário sacou R$565 deve ser entregue
/// 2 nota de R$200, 1 nota de R$100, 1 nota de R$50, 1 nota de R$10, 1 nota de R$5.
main(List<String> args) {
  // Valor solicitado para saque
  final valorSaque = 565;
  // Chama dispenser padrão
  Dispenser().sacar(valorSaque);
}

/// Classe para representar o caixa eletrônico
/// que implementa o Chain
class Dispenser {
  /// Chain of responsability
  Cedula? chain;

  /// Construtor
  Dispenser() {
    // Construção da cadeia
    chain = Cedula(
      valor: 200,
      proxima: Cedula(
        valor: 100,
        proxima: Cedula(
          valor: 50,
          proxima: Cedula(
            valor: 10,
            proxima: Cedula(
              valor: 5,
            ),
          ),
        ),
      ),
    );
  }

  /// Método para efetuar um sque no caixa
  void sacar(num valorRetirar) {
    chain?.execute(valorRetirar: valorRetirar);
  }
}

/// Classe para representar cédulas de dinheiro
class Cedula {
  /// Valor da cédula
  final int valor;

  /// Próxima cédula a ser processada
  final Cedula? proxima;

  /// Construtor
  Cedula({required this.valor, this.proxima});

  /// Método que processa o valor e manda o resto para o próximo elemento da cadeia
  void execute({required num valorRetirar}) {
    if (valorRetirar >= valor) {
      final qtdCedulas = valorRetirar / valor;
      print('${qtdCedulas.toInt()} cédula(s) de R\$$valor');
    }
    // Chama o próximo da cadeia se existir, passando o restante do valor
    proxima?.execute(valorRetirar: valorRetirar % valor);
  }
}
