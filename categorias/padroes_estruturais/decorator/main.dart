///
/// Decorator Pattern
///
/// O Decorator é um padrão que nos permite incrementar/decorar um objeto quantas vezes for necessário
///
/// O exemplo é baseado no vídeo do canal FullCycle:
/// https://www.youtube.com/watch?v=ZGr1X-RsvpQ&list=PL5aY_NrL1rjtP1GVk1lxifkeob1F09L4p&index=5
///
/// Referência:
/// https://refactoring.guru/pt-br/design-patterns/decorator
///
main(List<String> args) {
  print('\nMontando o lanche...\n');

  Pao pao1 = PaoFrances();
  print('1º pão: ${pao1.nome} - Valor: R\$ ${pao1.valor}\n');
  // Resultado: 1º pão: Pão francês - Valor: R$ 1

  Pao pao2 = PaoFrances();
  pao2 = RecheioSalsicha(pao: pao2);
  pao2 = RecheioCalabresa(pao: pao2);
  pao2 = RecheioFrangoComRequeijao(pao: pao2);
  print('2º pão: ${pao2.nome} - Valor: R\$ ${pao2.valor}\n');
  // Resultado: 2º pão: Pão francês, com salsicha, com calabresa, com frango e requeijão - Valor: R$ 10

  Pao pao3 = PaoBaguete();
  pao3 = RecheioFrangoComRequeijao(pao: pao3);
  print('3º pão: ${pao3.nome} - Valor: R\$ ${pao3.valor}\n');
  // Resultado: 3º pão: Pão baguete, com frango e requeijão - Valor: R$ 6
}

/// Abstração de pão
abstract class Pao {
  String get nome;
  num get valor;
}

/// Implementação de tipo de pão francês
class PaoFrances extends Pao {
  @override
  String get nome => 'Pão francês';
  @override
  num get valor => 1;
}

/// Implementação de tipo de pão baguete
class PaoBaguete extends Pao {
  @override
  String get nome => 'Pão baguete';
  @override
  num get valor => 2;
}

/// Implementação de recheio calabresa
class RecheioCalabresa extends Pao {
  Pao pao;
  RecheioCalabresa({this.pao});

  @override
  String get nome => '${pao.nome}, com calabresa';
  @override
  num get valor => pao.valor + 3;
}

/// Implementação de recheio salsicha
class RecheioSalsicha extends Pao {
  Pao pao;
  RecheioSalsicha({this.pao});

  @override
  String get nome => '${pao.nome}, com salsicha';
  @override
  num get valor => pao.valor + 2;
}

/// Implementação de recheio frango com requeijão
class RecheioFrangoComRequeijao extends Pao {
  Pao pao;
  RecheioFrangoComRequeijao({this.pao});

  @override
  String get nome => '${pao.nome}, com frango e requeijão';
  @override
  num get valor => pao.valor + 4;
}
