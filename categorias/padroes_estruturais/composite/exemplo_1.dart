///
/// Composite
///
/// O Composite é um padrão que permite utilizar recursão através de composição, de forma que parte e todo
/// são tratados de forma igual. Um bom exemplo disso no Flutter são widgets, onde um widget pode receber
/// outro e esse outro pode ter outros de forma recursiva.
/// No exemplo abaixo é feita uma simulação com [Arquivo]s e [Pasta]s onde ambos são [ItemSistemaArquivo]
///
main(List<String> args) {
  // Criação dos arquivos fictícios individualmente
  ItemSistemaArquivo arquivo1 = Arquivo(nome: 'aaa.dart');
  ItemSistemaArquivo arquivo1_1 = Arquivo(nome: 'aaa-aaa.dart');
  ItemSistemaArquivo arquivo2 = Arquivo(nome: 'bbb.dart');
  ItemSistemaArquivo arquivo3 = Arquivo(nome: 'ccc.dart');
  // Criação das pastas, composição da árvore de ItemSistemaArquivo
  ItemSistemaArquivo pasta4 = Pasta(nome: 'pasta4'); // Vazia
  ItemSistemaArquivo pasta3 = Pasta(nome: 'pasta3', listaItens: [arquivo3]); // Contém o arquivo 3
  ItemSistemaArquivo pasta2 = Pasta(nome: 'pasta2', listaItens: [arquivo2, pasta3]);
  ItemSistemaArquivo pasta1 = Pasta(nome: 'pasta1', listaItens: [arquivo1, arquivo1_1, pasta2]);
  ItemSistemaArquivo pastaRaiz = Pasta(nome: 'raiz', listaItens: [pasta1, pasta4]);
  // Imprimir diretórios a partie da raíz
  pastaRaiz.imprimir('');
}

/// Abstração que define um item do sistema de arquivos
abstract class ItemSistemaArquivo {
  /// Método de impressão que deve ser implementados por todos [ItemSistemaArquivo]
  imprimir(String estrutura);
}

/// Definição de um arquivo do sistema de arquivos
class Arquivo implements ItemSistemaArquivo {
  /// Nome do arquivo
  String nome;

  /// Construtor
  Arquivo({required this.nome});

  /// Imprime a estrutura precedente mais o seu nome
  @override
  imprimir(String estrutura) {
    print('$estrutura$nome');
  }
}

/// Definição de uma pasta do sistema de arquivos
class Pasta implements ItemSistemaArquivo {
  /// Nome da pasta
  String nome;

  /// Lista de [ItemSistemaArquivo]s que uma pasta pode ter
  /// Pode ser [Arquivo]s ou outras [Pasta]s
  List<ItemSistemaArquivo> listaItens;

  /// Construtor
  Pasta({
    required this.nome,
    this.listaItens = const <ItemSistemaArquivo>[],
  });

  /// Imprime estrutura da pasta atual
  @override
  imprimir(String estrutura) {
    if (listaItens.isEmpty) {
      print('$estrutura$nome[vazia]');
    } else {
      print('$estrutura$nome[tam. ${listaItens.length}]');
      // Se possuir itens os imprime, recursivamente...
      listaItens.forEach((itemSistemaArquivo) {
        itemSistemaArquivo.imprimir('$estrutura|   ');
      });
    }
  }
}
