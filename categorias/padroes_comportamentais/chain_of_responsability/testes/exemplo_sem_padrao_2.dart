/// Lógica de um caixa eletrônico onde é necessário calcular quantas notas de cada valor deve ser
/// entregue ao usuário na hora de um saque. Por exemplo se o usuário sacou R$565 deve ser entregue
/// 2 nota de R$200, 1 nota de R$10, 1 nota de R$10, 1 nota de R$10, 1 nota de R$5.
main(List<String> args) {
  // Lista de possíveis cédulas
  final List<Cedula> cedulas = [
    Cedula(valor: 200),
    Cedula(valor: 100),
    Cedula(valor: 50),
    Cedula(valor: 20),
    Cedula(valor: 10),
    Cedula(valor: 5),
  ];

  // Valor solicitado para saque
  final valorSaque = 795;
  num divisao = 0.0;
  num resto = valorSaque;

  // Percorre as cédulas verificando quais e quantas devem ser emitidas de cada valor
  for (var cedula in cedulas) {
    divisao = resto / cedula.valor;
    if (divisao >= 1) {
      print('${divisao.toInt()} cédula(s) de R\$${cedula.valor}');
    }
    // Envia para a próxima cédula o que restou
    resto %= cedula.valor;
  }
}

/// Classe para representar cédulas de dinheiro
class Cedula {
  /// Valor da cédula
  final int valor;

  /// Construtor
  Cedula({required this.valor});
}
