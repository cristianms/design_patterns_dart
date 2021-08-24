/// Lógica de um caixa eletrônico onde é necessário calcular quantas notas de cada valor deve ser
/// entregue ao usuário na hora de um saque. Por exemplo se o usuário sacou R$565 deve ser entregue
/// 2 nota de R$200, 1 nota de R$10, 1 nota de R$10, 1 nota de R$10, 1 nota de R$5.
main(List<String> args) {
  // Valor solicitado para saque
  final valorSaque = 565;

  Cedula200().execute(valorSaque);
}

/// Classe para representar cédulas de dinheiro
abstract class CedulaGen {
  /// Valor da cédula
  final int valor;

  /// Próxima cédula a ser processada
  final CedulaGen? proxima;

  /// Construtor
  CedulaGen({required this.valor, this.proxima});

  void execute(num valorRetirar);
}

class Cedula200 extends CedulaGen {
  Cedula200() : super(valor: 200, proxima: Cedula100());

  @override
  void execute(num valorRetirar) {
    if (valorRetirar >= valor) {
      final divisao = valorRetirar / valor;
      print('${divisao.toInt()} cédula(s) de R\$$valor');
    }
    proxima?.execute(valorRetirar % valor);
  }
}

class Cedula100 extends CedulaGen {
  Cedula100() : super(valor: 100, proxima: Cedula50());

  @override
  void execute(num valorRetirar) {
    if (valorRetirar >= valor) {
      final divisao = valorRetirar / valor;
      print('${divisao.toInt()} cédula(s) de R\$$valor');
    }
    proxima?.execute(valorRetirar % valor);
  }
}

class Cedula50 extends CedulaGen {
  Cedula50() : super(valor: 50, proxima: Cedula20());

  @override
  void execute(num valorRetirar) {
    if (valorRetirar >= valor) {
      final divisao = valorRetirar / valor;
      print('${divisao.toInt()} cédula(s) de R\$$valor');
    }
    proxima?.execute(valorRetirar % valor);
  }
}

class Cedula20 extends CedulaGen {
  Cedula20() : super(valor: 20, proxima: Cedula10());

  @override
  void execute(num valorRetirar) {
    if (valorRetirar >= valor) {
      final divisao = valorRetirar / valor;
      print('${divisao.toInt()} cédula(s) de R\$$valor');
    }
    proxima?.execute(valorRetirar % valor);
  }
}

class Cedula10 extends CedulaGen {
  Cedula10() : super(valor: 10, proxima: Cedula5());

  @override
  void execute(num valorRetirar) {
    if (valorRetirar >= valor) {
      final divisao = valorRetirar / valor;
      print('${divisao.toInt()} cédula(s) de R\$$valor');
    }
    proxima?.execute(valorRetirar % valor);
  }
}

class Cedula5 extends CedulaGen {
  Cedula5() : super(valor: 5);

  @override
  void execute(num valorRetirar) {
    if (valorRetirar >= valor) {
      final divisao = valorRetirar / valor;
      print('${divisao.toInt()} cédula(s) de R\$$valor');
    }
    proxima?.execute(valorRetirar % valor);
  }
}
