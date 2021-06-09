///
/// Builder
///
/// O padrão Builder possibilita definir um objeto que implemente as regras certas para montar objeto mais complexos.
/// No exemplo abaixo a a classe [Diretor] atua como builder, ela possui os passos para criação de cada tipo de objeto 
/// pedido e faz isso através do builder recebido.
///
/// Referência: https://refactoring.guru/pt-br/design-patterns/builder/
///             https://www.youtube.com/watch?v=W-96z2EjoJ0
///
main(List<String> args) {
  print('\nCriando objetos com Builder...\n');

  // Inicializa Diretor
  final diretor = Diretor();
  // Inicializar builder CarroBuilder
  final carroBuilder = CarroBuilder();
  // Diretor criar novo carro com base no builder recebido CarroBuilder
  diretor.buildCarroEsportivo(carroBuilder);
  Carro carro = carroBuilder.getResultado();
  print('Carro construído com CarroBuilder:');
  print('${carro.toString()}\n');

  // Diretor criar novo carro com base no builder recebido CarroBuilder
  diretor.buildCarroSUV(carroBuilder);
  carro = carroBuilder.getResultado();
  print('Carro construído com CarroBuilder:');
  print('${carro.toString()}\n');

  // Inicializar builder CarroManualBuilder
  final carroManualBuilder = CarroManualBuilder();
  // Diretor criar novo carro com base no builder recebido CarroManualBuilder
  diretor.buildCarroEsportivo(carroManualBuilder);
  carro = carroManualBuilder.getResultado();
  print('Carro maual construído com CarroManualBuilder:');
  print('${carro.toString()}\n');


}

/// Define interface para construtores de [Carro]
abstract class ContratoCarroBuilder {
  setTipoCarro(String tipoCarro);
  setPotencia(num potencia);
  setPossuiGPS(bool possuiGPS);
  setPossuiAlarme(bool possuiAlarme);
  setPossuiCambioAutomatico(bool possuiCambioAutomatuico);
}

/// Define classe para objeto construtor de [Carro]
class CarroBuilder extends ContratoCarroBuilder {
  late String _tipoCarro;
  late num _potencia;
  late bool _possuiGPS;
  late bool _possuiAlarme;
  late bool _possuiCambioAutomatico;

  @override
  setTipoCarro(String tipoCarro) {
    _tipoCarro = tipoCarro;
  }

  @override
  setPotencia(num potencia) {
    _potencia = potencia;
  }

  @override
  setPossuiGPS(bool possuiGPS) {
    _possuiGPS = possuiGPS;
  }

  @override
  setPossuiAlarme(bool possuiAlarme) {
    _possuiAlarme = possuiAlarme;
  }

  @override
  setPossuiCambioAutomatico(possuiCambioAutomatico) {
    _possuiCambioAutomatico = possuiCambioAutomatico;
  }

  /// Retorna o carro resultando da construção
  Carro getResultado() {
    return Carro(
      tipoCarro: _tipoCarro,
      potencia: _potencia,
      possuiGPS: _possuiGPS,
      possuiAlarme: _possuiAlarme,
      possuiCambioAutomatico: _possuiCambioAutomatico,
    );
  }
}

/// Define classe para objeto construtor de carro manual do tipo [Carro]
class CarroManualBuilder extends ContratoCarroBuilder {
  late String _tipoCarro;
  late num _potencia;
  late bool _possuiGPS;
  late bool _possuiAlarme;
  late bool _possuiCambioAutomatico;

  @override
  setTipoCarro(String tipoCarro) {
    _tipoCarro = tipoCarro;
  }

  @override
  setPotencia(num potencia) {
    _potencia = potencia;
  }

  @override
  setPossuiGPS(bool possuiGPS) {
    _possuiGPS = possuiGPS;
  }

  @override
  setPossuiAlarme(bool possuiAlarme) {
    _possuiAlarme = possuiAlarme;
  }

  @override
  setPossuiCambioAutomatico(possuiCambioAutomatico) {
    _possuiCambioAutomatico = possuiCambioAutomatico;
  }

  /// Retorna o carro resultando da construção
  Carro getResultado() {
    return Carro(
      tipoCarro: _tipoCarro,
      potencia: _potencia,
      possuiGPS: _possuiGPS,
      possuiAlarme: _possuiAlarme,
      possuiCambioAutomatico: _possuiCambioAutomatico,
    );
  }
}

/// Produto - Tipo do objeto resultante do builder [CarroBuilder]
class Carro {
  String tipoCarro;
  num potencia;
  bool possuiGPS;
  bool possuiAlarme;
  bool possuiCambioAutomatico;

  /// Construtor
  Carro({
    required this.tipoCarro,
    required this.potencia,
    required this.possuiGPS,
    required this.possuiAlarme,
    required this.possuiCambioAutomatico,
  });

  @override
  String toString() {
    return 'Carro(tipoCarro: $tipoCarro, potencia: $potencia, possuiGPS: $possuiGPS, possuiAlarme: $possuiAlarme, possuiCambioAutomatico: $possuiCambioAutomatico)';
  }
}

/// Outro Produto - Outro possível tipo do objeto resultante do builder
class CarroManual {
  String tipoCarro;
  num potencia;
  bool possuiGPS;
  bool possuiAlarme;
  bool possuiCambioAutomatico;

  /// Construtor
  CarroManual({
    required this.tipoCarro,
    required this.potencia,
    required this.possuiGPS,
    required this.possuiAlarme,
    required this.possuiCambioAutomatico,
  });

  @override
  String toString() {
    return 'CarroManual(tipoCarro: $tipoCarro, potencia: $potencia, possuiGPS: $possuiGPS, possuiAlarme: $possuiAlarme, possuiCambioAutomatico: $possuiCambioAutomatico)';
  }
}

/// Classe que define uma ordem de criação/eecução das etapas de construção
/// Realiza a construção através de um [Builder] recebido, portanto pode não saber qual será o objeto produzido
class Diretor {
  /// Executa os passos necessários para montar um carro esportivo
  void buildCarroEsportivo(ContratoCarroBuilder builder) {
    builder.setTipoCarro('Carro Esportivo');
    builder.setPotencia(1.0);
    builder.setPossuiGPS(true);
    builder.setPossuiAlarme(true);
    builder.setPossuiCambioAutomatico(false);
  }

  /// Executa os passos necessários para montar um carro SUV
  void buildCarroSUV(ContratoCarroBuilder builder) {
    builder.setTipoCarro('Carro SUV');
    builder.setPotencia(2.0);
    builder.setPossuiGPS(true);
    builder.setPossuiAlarme(true);
    builder.setPossuiCambioAutomatico(true);
  }
}
