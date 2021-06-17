///
/// Abstract Factory
///
/// O padrão abstract factory possibilita criarmos uma fábrica para famílias de objetos onde a interface não conhece 
/// os tipos concretos.
/// No caso do exemplo abaixo a interface LevelAbstractFactory representa a abstract factory, ela obriga a implementação 
/// de métodos de construção de cenário e inimigo no entanto não conhece qual será o cenário e inimigo concretos retornados
/// pois isso será decidido pelas inplementações da abstract factory Level1Factory e Level2Factory, no caso.
///
/// Referência: https://refactoring.guru/pt-br/design-patterns/abstract-factory
///
main(List<String> args) {
  print('\nCriando objetos com Factory Method...\n');

  print(' > Level 1:\n');
  LevelAbstractFactory level1Factory = Level1Factory();
  level1Factory.getCenario().build();
  level1Factory.getInimigo().build();

  print('\n > Level 2:\n');

  LevelAbstractFactory level2Factory = Level2Factory();
  level2Factory.getCenario().build();
  level2Factory.getInimigo().build();
  print('\n');
}

/// Abstração que representa a abstract factory
/// 
/// Aqui decidimos qual métodos devem ser implementados e quais tipos de retorno, porém não sabemos 
/// qual serão os objetos concretos retornados, isso é decidido nas factories que implementarem essa interface
abstract class LevelAbstractFactory {
  Cenario getCenario();
  Inimigo getInimigo();
}

/// Factory para montagem dos objetos referentes ao level 1
class Level1Factory implements LevelAbstractFactory {
  @override
  Cenario getCenario() {
    return CenarioNivel1();
  }

  @override
  Inimigo getInimigo() {
    return InimigoNivel1();
  }
}

/// Factory para montagem dos objetos referentes ao level 2
class Level2Factory implements LevelAbstractFactory {
  @override
  Cenario getCenario() {
    return CenarioNivel2();
  }

  @override
  Inimigo getInimigo() {
    return InimigoNivel2();
  }
}

///
///
/// Abstração para o cenário do jogo
abstract class Cenario {
  void build();
}

/// Abstração para os inimigos do jogo
abstract class Inimigo {
  void build();
}

/// Implementações concretas de cenário
class CenarioNivel1 implements Cenario {
  @override
  void build() => print(' > Montando cenário nível 1');
}

class CenarioNivel2 implements Cenario {
  @override
  void build() => print(' > Montando cenário nível 2');
}

/// Implementações concretas de inimigo
class InimigoNivel1 implements Inimigo {
  @override
  void build() => print(' > Montando inimigo nível 1');
}

class InimigoNivel2 implements Inimigo {
  @override
  void build() => print(' > Montando inimigo nível 2');
}
