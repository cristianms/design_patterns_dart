/// https://refactoring.guru/pt-br/design-patterns/adapter/php/example
main(List<String> args) {
  print('\nAplicando Adapter...\n');

  final minhaClasse = MinhaClasseTarget();
  minhaClasse.imprimeMensagem();
  // Resposta: Mensagem padrão

  final classeTerceiros = OutraClasseAdaptee();
  print(classeTerceiros.imprimeMensagemEspecifica());
  // Resposta: Mensagem específica

  final adapter = MinhaClasseAdapterParaAdaptee(adaptee: classeTerceiros);
  adapter.imprimeMensagem();
  // Resposta: Mensagem adaptada pelo MeuAdapter(Mensagem específica)
}

/// Target é a classe que desejamos que consiga acessar as funcionalidades de uma outra classe remota (Adaptee por ex)
class MinhaClasseTarget {
  void imprimeMensagem() {
    print('Mensagem padrão');
  }
}

/// Adaptee, é a classe que queremos acessar através do adapter
class OutraClasseAdaptee {
  String imprimeMensagemEspecifica() {
    return 'Mensagem específica';
  }
}

/// Adapter, classe que herda da Target (MinhaClasseTarget)
/// Ou seja essa classe representa um Target porém consegue acessar os métodos do Adaptee
class MinhaClasseAdapterParaAdaptee extends MinhaClasseTarget {
  /// Classe que
  OutraClasseAdaptee adaptee;

  /// Construtor - Recebe a instância da classe que queremos adaptar
  MinhaClasseAdapterParaAdaptee({required this.adaptee});

  /// Aqui sobrescrevemos o método 'imprimeMensagem' da classe pai fazendo a adaptação
  imprimeMensagem() {
    print('Mensagem adaptada pelo MeuAdapter(${adaptee.imprimeMensagemEspecifica()})');
  }
}
