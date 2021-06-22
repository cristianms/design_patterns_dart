import 'dart:async';

/// Teste utilizando stream
///
main() async {
  // Inicializa fluxo de stream
  StreamController<int> streamController = StreamController<int>.broadcast();

  // Define ação que deve ocorrer quando tiver novos objetos no fluxo do stream
  // Listener 1
  streamController.stream.listen((valor1) => print(' > Listener 1 - Novo valor no stream: $valor1'));
  streamController.add(111);

  // Listener 2
  streamController.stream.listen((valor2) => print(' > Listener 2 - Novo valor no stream: $valor2'));
  streamController.add(222);

  // Criação de objetos
  print('\nCriação de objetos..\n');
  TesteA(streamController);
  streamController.add(333);
  TesteB(streamController);
  streamController.add(444);

  // Finaliza fluxo de stream
  streamController.close();
}

class TesteA {
  StreamController<int> streamController;
  TesteA(this.streamController) {
    streamController.stream.listen((valor) => print(' >> Listener TesteA: $valor'));
  }
}

class TesteB {
  StreamController<int> streamController;
  TesteB(this.streamController) {
    streamController.stream.listen((valor) => print(' >> Listener TesteB: $valor'));
  }
}
