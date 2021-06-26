///
/// Singleton
///
/// O padrão Singleton nos permite ter apenas uma instância de uma classe.
/// Esse padrão é comumente aplicado no gerenciamento de coneões com o banco de dados.
///
/// Referência: https://refactoring.guru/pt-br/design-patterns/singleton
///
main(List<String> args) {
  // Obtém instância do pool
  var pool_a = ConnectionPool.getInstance;

  // Obtém uma conexão do pool
  var conn = pool_a.getConnection();
  if (conn != null) {
    conn.query('SELECT * FROM tabela1;');
  }

  // Obtém uma conexão do pool
  var conn2 = pool_a.getConnection();
  if (conn2 != null) {
    conn2.query('SELECT * FROM tabela2;');
  }

  // Obtém "nova" instância do pool, na verdade será a mesma que a anterior
  var pool_b = ConnectionPool.getInstance;
  // Obtém uma conexão do pool
  var conn3 = pool_b.getConnection();
  if (conn3 != null) {
    conn3.query('SELECT * FROM tabela3;');
  }
}

/// Classe para representar o pool de coneões
/// Aqui vemos que getInstance é estático de forma que só eistirá uma instância dessa classe
class ConnectionPool {
  /// Quantidade de conexões liberadas para uso
  static final POOL_SIZE = 2;

  /// Instância singleton, irá chamar o construtor privado
  static final ConnectionPool getInstance = ConnectionPool._();

  /// Lista de conexões
  static List<Connection> _connections = <Connection>[];

  /// Construtor privado que será chama uma única vez durante a execução
  ConnectionPool._() {
    // Inicializa lista de conexões
    print(' > Inicializando lista de conexões...');
    for (int i = 0; i < POOL_SIZE; i++) {
      _connections.add(Connection());
    }
  }

  /// Método que obtém uma conexão que estiver disponível na lista
  Connection? getConnection() {
    Connection? connAvailable = null;
    // Percorre todas até encontrar uma disponível
    for (final conn in _connections) {
      if (conn.inUse == false) {
        connAvailable = conn;
        break;
      }
    }
    // Se não encontrar nenhuma, encerra a execução
    if (connAvailable == null) {
      print(' > Nenhuma conexão disponível');
      return null;
    }
    // Seta como "em uso"
    connAvailable.inUse = true;
    return connAvailable;
  }
}

/// Model que representa uma conexão com o banco de dados
class Connection {
  /// Flag que indica se a conexão já está em uso
  late bool inUse = false;

  /// Método de execução da query
  void query(String sql) {
    print(' > Rodando SQL: $sql');
  }
}
