///
/// Facade
///
/// O Facada possibilita a criação de uma interface que facilite o uso e acesso a subsistemas.
/// Em um cenário onde diversos serviços são acessados diretamente para fazer uma terafa um Facade poderia
/// centralizar toda essa regra e acessos em um único ponto, dessa forma facilita o acesso a essa tarefa.
///
/// Referência: https://refactoring.guru/pt-br/design-patterns/facade
///
main(List<String> args) {
  // Inicializa Facade
  final facadePrint = FacadePrint(servicePrint1: ServicePrint1(), servicePrint2: ServicePrint2());
  // Imprime apenas letras através da fachada
  print('\n > Imprimindo apenas letras');
  facadePrint.printOnlyLetters();
  // Imprime apenas números através da fachada
  print('\n > Imprimindo apenas números');
  facadePrint.printOnlyNumbers();
  // Imprime tudo através da fachada
  print('\n > Imprimindo tudo');
  facadePrint.printAllIn();
}

class FacadePrint {
  /// Define serviços de impressão
  ServicePrint1 servicePrint1;
  ServicePrint2 servicePrint2;

  /// Construtor
  FacadePrint({required this.servicePrint1, required this.servicePrint2});

  /// Imprime apenas letras
  void printOnlyLetters() {
    servicePrint1.printA();
    servicePrint1.printB();
    servicePrint1.printC();
    servicePrint1.printD();
  }

  /// Imprime apenas números
  void printOnlyNumbers() {
    servicePrint2.print1();
    servicePrint2.print2();
    servicePrint2.print3();
    servicePrint2.print4();
  }

  /// Imprime tudo
  void printAllIn() {
    printOnlyLetters();
    printOnlyNumbers();
  }
}

/// Serviço que representa um subsistema
class ServicePrint1 {
  void printA() => print(' >>> Imprimindo AAA');
  void printB() => print(' >>> Imprimindo BBB');
  void printC() => print(' >>> Imprimindo CCC');
  void printD() => print(' >>> Imprimindo DDD');
}

/// Serviço que representa um subsistema
class ServicePrint2 {
  void print1() => print(' >>> Imprimindo 111');
  void print2() => print(' >>> Imprimindo 222');
  void print3() => print(' >>> Imprimindo 333');
  void print4() => print(' >>> Imprimindo 444');
}
