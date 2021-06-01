///
/// Factory Method
///
/// O padrão factory method possibilita criarmos uma fábrica dinâmica de objetos de um tipo específico.
/// No exemplo abaixo a fábrica é utilizada como uma abstração de publicador de redes sociais, ou seja cada instância de
/// publicador precisa implementar os métodos necessários para que também seja um publicador.
///
/// Referência: https://refactoring.guru/pt-br/design-patterns/factory-method
///
main(List<String> args) {
  print('\nCriando objetos com Factory Method...\n');

  // Realiza uma publicação para o Facebook
  final publicadorFacebook = PublicadorFacebook('usuario_a', '123456');
  publicadorFacebook.post('Esse texto vai para o Facebook........');
  print('\n');

  // Realiza uma publicação para o LinkedIn
  final publicadorLinkIn = PublicadorLinkedIn('usuario_b', '456789');
  publicadorLinkIn.post('Esse texto será publicado no LinkedIn........');
  print('\n');
}

/// Conector do Facebook
class FacebookConector implements ConectorRedeSocial {
  String usuario;
  String senha;
  FacebookConector(this.usuario, this.senha);

  @override
  login() {
    return print(' > Realiza request de login no Facebook');
  }

  @override
  logout() {
    return print(' > Realiza request de logout no Facebook');
  }

  @override
  createPost(String conteudo) {
    return print(' > Realiza post de publicação no Facebook... $conteudo');
  }
}

/// Conector do LinkedIn
class LinkedInConector implements ConectorRedeSocial {
  String usuario;
  String senha;
  LinkedInConector(this.usuario, this.senha);

  @override
  login() {
    return print(' > Realiza request de login no LinkedInConector');
  }

  @override
  logout() {
    return print(' > Realiza request de logout no LinkedInConector');
  }

  @override
  createPost(String conteudo) {
    return print(' > Realiza post de publicação no LinkedInConector... $conteudo');
  }
}

/// Contrato para conectores de redes sociais
///
/// Quando precisar utilizar outras redes sociais basta criar uma nova classe concreta implementando essa interface
/// Por ex.: 'class TwitterConector implements ConectorRedeSocial'
abstract class ConectorRedeSocial {
  login();
  logout();
  createPost(String conteudo);
}

/// Representa a Factory
///
/// Classe que realiza o post com base no conector recebido
abstract class PublicadorRedeSocialFactory {
  /// Conector abstrato, que receberá a implementação concreta do conector durante a execução
  ConectorRedeSocial getRedeSocialDoPublicador();

  /// Método que consome a abstração, utilizando as instâncias concretas
  post(String conteudo) {
    // Obtém o objeto concreto (PublicadorFacebook ou PublicadorLinkedIn)
    ConectorRedeSocial redeSocial = getRedeSocialDoPublicador();
    redeSocial.login();
    redeSocial.createPost(conteudo);
    redeSocial.logout();
  }
}

/// Implementação concreta de publicador, implementa a factory PublicadorRedeSocialFactory
class PublicadorFacebook extends PublicadorRedeSocialFactory {
  String usuario;
  String senha;
  PublicadorFacebook(this.usuario, this.senha);

  @override
  ConectorRedeSocial getRedeSocialDoPublicador() {
    return FacebookConector(usuario, senha);
  }
}

/// Implementação concreta de publicador implementa a factory PublicadorRedeSocialFactory
class PublicadorLinkedIn extends PublicadorRedeSocialFactory {
  String usuario;
  String senha;
  PublicadorLinkedIn(this.usuario, this.senha);

  @override
  ConectorRedeSocial getRedeSocialDoPublicador() {
    return LinkedInConector(usuario, senha);
  }
}
