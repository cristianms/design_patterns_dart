///
/// FlyWeight
/// 
/// Esse padrão nos permite cachear instâncias de objetos. Quando se tem muitas instâncias de um mesmo objeto
/// com informações repetidas entre elas podemos cachear em um outro objeto único essas informações que não mudam.
///
/// O exemplo abaixo simula um servidor de stream de músicas onde temos um cache de musicas com os 
/// dados intrínsecos [MusicaFlyWeight], e as instâncias com os dados extrínsecos [Musica] que podem mudar.
/// Resumindo, no mundo todo podemos ter milhares de usuários ouvindo uma mesma música e nesse caso o objeto que 
/// contém informações como nome da música e duração nunca mudam, nesse casos podemos aplicar o FlyWeight.
/// Obs.: Nesse emplo podemos perceber a utilização de outro pattern, o Singleton, para manipular o cache.
///
/// Referência do padrão: https://refactoring.guru/pt-br/design-patterns/flyweight
///
main(List<String> args) {
  final flyWeightFactory = FlyWeightFactory.getInstance;
  Musica(
    musicaFlyWeight: flyWeightFactory.getMusic('Nothing Else Matters'),
    playingTime: 0, // 0 seconds
  );
  Musica(
    musicaFlyWeight: flyWeightFactory.getMusic('Nothing Else Matters'),
    playingTime: 30, // 30 seconds
  );
  Musica(
    musicaFlyWeight: flyWeightFactory.getMusic('Unforgiven'),
    playingTime: 10, // 30 seconds
  );
  Musica(
    musicaFlyWeight: flyWeightFactory.getMusic('Nothing Else Matters'),
    playingTime: 120, // 120 seconds
  );

  flyWeightFactory.printCache();
}

/// Representa o objeto que poderá ser cacheado pela factory
class MusicaFlyWeight {
  String nome;
  MusicaFlyWeight({required this.nome});
}

/// Representa o objeto volátil, que muda
class Musica {
  MusicaFlyWeight musicaFlyWeight;
  int playingTime;
  Musica({
    required this.musicaFlyWeight,
    required this.playingTime,
  });
}

/// Factory que irá gerenciar as instâncias de FlyWeight
class FlyWeightFactory {
  /// Construtor privado
  FlyWeightFactory._();

  /// Propriedade estática que representa o Singleton
  static FlyWeightFactory getInstance = FlyWeightFactory._();

  /// Representa o cache/lista de FlyWeights usados
  static List<MusicaFlyWeight> cacheMusicas = <MusicaFlyWeight>[];

  /// Obtém ou cria uma instância da MusicaFlyWeight da lista em cache
  MusicaFlyWeight getMusic(String nome) {
    final resultado = cacheMusicas.where((element) => element.nome == nome);
    if (resultado.isNotEmpty) {
      return resultado.toList().first;
    }
    return _criaAddMusica(nome);
  }

  MusicaFlyWeight _criaAddMusica(String nome) {
    print(' >>> Adding > $nome');
    final musicaNova = MusicaFlyWeight(nome: nome);
    cacheMusicas.add(musicaNova);
    return musicaNova;
  }

  printCache() {
    print(' >>> QTD músicas em cache: ${cacheMusicas.length}');
    for (final musicaFlyWeight in cacheMusicas) {
      print(' >>> ${musicaFlyWeight.nome}');
    }
  }
}
