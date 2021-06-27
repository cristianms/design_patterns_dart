///
/// Proxy
///
/// Esse padrão nos permite criar uma extensão de um objeto para possibilitar o acesso a ele
/// através de outra interface que pode possuir mais validações ou restrições.
/// No exemplo abaixo podemos acessar o objeto banco diretamente mas caso o cliente esteja acessando 
/// via um caixa eletrônico perceberá que eistem restrições.
/// 
/// Referência do padrão: https://refactoring.guru/pt-br/design-patterns/proxy
///
main(List<String> args) {
  print('\n > Operação feita diretamente pelo banco');
  final bank = Bank();
  bank.withdraw(111, '111', 301);

  print('\n > Operação feita através do caixa eletrônico');
  final atm = ATM(bank);
  atm.withdraw(111, '222', 301);
}

/// Model de usuário
class User {
  String name;
  num accountNumber;
  String password;
  num balance; // Saldo
  User({required this.name, required this.accountNumber, required this.password, required this.balance});
}

/// Abstração para operações bancárias
abstract class BankOperations {
  void deposit(num account, num amount); // Depósito
  void withdraw(num account, String pass, num amount); // Retirada
  void changePassword(num account, String oldPass, String newPass); // Atualização de senha
}

/// Implementação concreta do banco
class Bank implements BankOperations {
  List<User> listaUsuarios = <User>[];

  Bank() {
    listaUsuarios.add(User(name: 'UserA', accountNumber: 111, password: '111111', balance: 111));
    listaUsuarios.add(User(name: 'UserB', accountNumber: 222, password: '222222', balance: 222));
    listaUsuarios.add(User(name: 'UserC', accountNumber: 222, password: '333333', balance: 333));
  }

  @override
  void changePassword(num account, String oldPass, String newPass) {
    if (newPass == '') {
      print(' > Nova senha não pode ser vazia');
      return;
    }
    if (newPass == oldPass) {
      print(' > Nova senha não pode ser igual a antiga');
      return;
    }
    // Obtém usuário
    final user = getUser(account);
    if (user == null) {
      print(' > Usuário não encontrado');
      return;
    }
    user.password = newPass;
    print(' > Senha atualizada com sucesso');
  }

  @override
  void deposit(num account, num amount) {
    // Obtém usuário
    final user = getUser(account);
    if (user == null) {
      print(' > Usuário não encontrado');
      return;
    }
    user.balance += amount;
    print(' > Depósito realizado com sucesso');
  }

  @override
  void withdraw(num account, String pass, num amount) {
    // Obtém usuário
    final user = getUser(account);
    if (user == null) {
      print(' > Usuário não encontrado');
      return;
    }
    user.balance -= amount;
    print(' > Saque realizado com sucesso');
  }

  User? getUser(num account) {
    // final listaFiltrada = listaUsuarios.where((user) => user.accountNumber == account).toList();
    // if (listaFiltrada.isNotEmpty) {
    //   return listaFiltrada.first;
    // }
    // return null;
    return listaUsuarios.firstWhereOrNull((element) => element.accountNumber == account);
  }
}

/// Implementação concreta para o caia eletrônico
class ATM implements BankOperations {
  /// Injenção do objeto do banco
  Bank bank;
  ATM(this.bank);

  @override
  void changePassword(num account, String oldPass, String newPass) {
    print(' > Esse tipo de operação pode ser feito apenas na agência física');
  }

  @override
  void deposit(num account, num amount) {
    bank.deposit(account, amount);
  }

  @override
  void withdraw(num account, String pass, num amount) {
    if (amount > 300) {
      print(' > O valor máimo permitido para saque no caia eletrônico é 300');
      return;
    }
    bank.withdraw(account, pass, amount);
  }
}

///
/// Criação de extensão para facilitar o uso do firstWhere em Iterables
///
extension FirstWhereOrNull<E> on Iterable<E> {
  // Retorna o tipo genérico T
  // Recebe por parâmetro um método de teste que retorna um bool
  E? firstWhereOrNull(bool Function(E element) test) {
    for (final element in this) {
      // Se passar no teste recebido já retorna o elemento
      if (test(element)) {
        return element;
      }
    }
    return null;
  }
}
