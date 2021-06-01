///
/// Observer
///
/// O padrão observer possibilita notificar entidades interessadas (subscribers) sobre atualizações
/// em uma outra entidade observável (observable).
///
/// Referência: https://refactoring.guru/pt-br/design-patterns/observer
///
main(List<String> args) {
  print('\nUtilizando o Observer Pattern...\n');
  // Inicializamos o observable
  final quantidade = QuantidadeObservavel();
  // Inicializamos os assinantes
  final inscritoA = MonitorAssinanteDeQuantidade('Inscrito_A');
  final inscritoB = MonitorAssinanteDeQuantidade('Inscrito_B');
  final inscritoC = MonitorAssinanteDeQuantidade('Inscrito_C');

  // Aqui ninguém é notificado ainda pois ainda não há assinantes
  quantidade.incrementar();
  print(' > Contador: ${quantidade.contador}');
  // Resultado: > Contador: 1

  quantidade.addSubscriber(inscritoA);
  quantidade.incrementar();
  // Resultado: >> Monitor Inscrito_A > Recebendo qtd > 2

  quantidade.addSubscriber(inscritoB);
  quantidade.incrementar();
  // Resultado: >> Monitor Inscrito_A > Recebendo qtd > 3
  // Resultado: >> Monitor Inscrito_B > Recebendo qtd > 3

  quantidade.addSubscriber(inscritoC);
  quantidade.decrementar();
  // Resultado: >> Monitor Inscrito_A > Recebendo qtd > 2
  // Resultado: >> Monitor Inscrito_B > Recebendo qtd > 2
  // Resultado: >> Monitor Inscrito_C > Recebendo qtd > 2
}

/// Abstração para classes assinantes/subscribers de Observables
///
/// T aqui é o tipo do Observable, no caso da implementação será QuantidadeObservavel
abstract class Subscriber<T extends Observable> {
  update(T observable);
}

/// Definição de Observable
///
/// Abstração para objeto observáveis
abstract class Observable {
  /// Lista de assinantes do objeto observável
  final _subscribers = <Subscriber>[];

  /// Adiciona um assinante
  addSubscriber(Subscriber newSubscriber) {
    _subscribers.add(newSubscriber);
  }

  /// Notifica assinantes sobre atualização
  notifySubscribers() {
    for (final subscriber in _subscribers) {
      // Envia cópia do objeto
      subscriber.update(this);
    }
  }
}

/// Classe que poderá ser observada por múltiplos assinantes
class QuantidadeObservavel extends Observable {
  /// Propriedade que vamos alterar
  int _contador = 0;

  set contador(valor) {
    _contador = valor;
    // Notifica assinantes
    notifySubscribers();
  }

  incrementar() {
    _contador++;
    // Notifica assinantes
    notifySubscribers();
  }

  decrementar() {
    if (_contador > 0) {
      _contador--;
      // Notifica assinantes
      notifySubscribers();
    }
  }

  int get contador => _contador;
}

/// Monitor, classe que é um assinante de QuantidadeObservavel
class MonitorAssinanteDeQuantidade extends Subscriber<QuantidadeObservavel> {
  /// Identificador do monitor
  String nomeMonitor;

  /// Construtor
  MonitorAssinanteDeQuantidade(this.nomeMonitor);

  /// Implementa ação para quando receber notificações
  @override
  update(QuantidadeObservavel observable) {
    print(' >> Monitor $nomeMonitor > Recebendo qtd > ${observable.contador}');
    return null;
  }
}
