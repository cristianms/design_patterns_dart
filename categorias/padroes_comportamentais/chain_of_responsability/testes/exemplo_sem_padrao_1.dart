/// Lógica de um caixa eletrônico onde é necessário calcular quantas notas de cada valor deve ser
/// entregue ao usuário na hora de um saque. Por exemplo se o usuário sacou R$565 deve ser entregue
/// 2 nota de R$200, 1 nota de R$10, 1 nota de R$10, 1 nota de R$10, 1 nota de R$5.
main(List<String> args) {
  // Valor solicitado para saque
  final valorSaque = 795;
  num divisao = 0.0;
  num resto = valorSaque;

  divisao = valorSaque / 200;
  if (divisao >= 1) {
    print('${divisao.toInt()} cédula(s) de R\$200');
  }
  resto %= 200;

  divisao = resto / 100;
  if (divisao >= 1) {
    print('${divisao.toInt()} cédula(s) de R\$100');
  }
  resto %= 100;

  divisao = resto / 50;
  if (divisao >= 1) {
    print('${divisao.toInt()} cédula(s) de R\$50');
  }
  resto %= 50;

  divisao = resto / 20;
  if (divisao >= 1) {
    print('${divisao.toInt()} cédula(s) de R\$20');
  }
  resto %= 20;

  divisao = resto / 10;
  if (divisao >= 1) {
    print('${divisao.toInt()} cédula(s) de R\$10');
  }
  resto %= 10;

  divisao = resto / 5;
  if (divisao >= 1) {
    print('${divisao.toInt()} cédula(s) de R\$5');
  }
}