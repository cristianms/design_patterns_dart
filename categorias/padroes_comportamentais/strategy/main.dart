///
/// Strategy Pattern
///
/// O padrão Strategy possibilita separar as implementações de subtipos de uma classe de forma que
/// o uso fique abstraído, mantendo assim o Open-Closed-Principle intacto
///
/// O exemplo é baseado no vídeo do canal FullCycle:
/// https://www.youtube.com/watch?v=pxmqkzWPW6E&list=PL5aY_NrL1rjtP1GVk1lxifkeob1F09L4p&index=4
///
/// Referência:
/// https://refactoring.guru/pt-br/design-patterns/strategy
///
main(List<String> args) {
  print('\nCalculando juros com Strategy...\n');

  final calcJurosSantander = CalculadoraDeJuros(Santander());
  final calcJurosBB = CalculadoraDeJuros(BancoDoBrasil());
  final calcJurosNubank = CalculadoraDeJuros(Nubank());

  final pedido1 = Pedido(cliente: 'A', valorTotal: 100);
  print('Pedido ${pedido1.cliente} valor total ${pedido1.valorTotal}');
  print('..taxa de juros do banco ${calcJurosSantander.calculaJuros(pedido1)}\n');
  // Resultado: Pedido A valor total 100
  // Resultado:..tem taxa de juros 5.0

  final pedido2 = Pedido(cliente: 'B', valorTotal: 15000);
  print('Pedido ${pedido2.cliente} valor total ${pedido2.valorTotal}');
  print('..taxa de juros do banco ${calcJurosBB.calculaJuros(pedido2)}\n');
  // Resultado: Pedido B valor total 15000
  // Resultado: ..tem taxa de juros 300.0

  final pedido3 = Pedido(cliente: 'C', valorTotal: 50000);
  print('Pedido ${pedido3.cliente} valor total ${pedido3.valorTotal}');
  print('..taxa de juros do banco ${calcJurosNubank.calculaJuros(pedido3)}\n');
  // Resultado: Pedido C valor total 50000
  // Resultado: ..tem taxa de juros 0.0
  print('\n');
}

/// Classe que irá realizar o cálculo
class CalculadoraDeJuros {
  /// Abstração de banco
  BancoInterface calculadorDeJurosBancario;

  /// Construtor - Recebe um banco (BancoInterface)
  CalculadoraDeJuros(this.calculadorDeJurosBancario);

  /// Calcula o juros através das informações (banco e pedido)
  num calculaJuros(Pedido pedido) {
    // Chama o cálculo de juros da implementação concreta do banco
    return calculadorDeJurosBancario.calculaJuros(pedido);
  }
}

/// Model de pedido
class Pedido {
  String cliente;
  num valorTotal;
  Pedido({
    this.cliente,
    this.valorTotal,
  });
}

/// Abstração/contrato que os bancos devem implementar
abstract class BancoInterface {
  num getPercentualTaxaJuros();
  num calculaJuros(Pedido pedido) {
    return pedido.valorTotal * (getPercentualTaxaJuros() / 100);
  }
}

/// Implementação de banco
class Santander extends BancoInterface {
  @override
  num getPercentualTaxaJuros() {
    return 5;
  }
}

/// Implementação de banco
class BancoDoBrasil extends BancoInterface {
  @override
  num getPercentualTaxaJuros() {
    return 2;
  }
}

/// Implementação de banco
class Nubank extends BancoInterface {
  @override
  num getPercentualTaxaJuros() {
    return 0;
  }
}
