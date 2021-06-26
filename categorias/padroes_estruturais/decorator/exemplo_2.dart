main(List<String> args) {
  print(' > Preparando drink...\n');
  final drink = Expresso();
  final expressoComLeite = MilkDec(drink);
  final doubleDrink = DoubleDrinkDec(expressoComLeite);
  final chocDrink = ChocolateDec(doubleDrink);
  chocDrink.serve();
  print(' > Price: ${chocDrink.getPrice()}\n');
}

/// Abstração para drinks
abstract class Drink {
  // Monta o drink
  void serve();
  // Obtém o preço do drink
  double getPrice();
}

/// Implementação concreta de [Drink]
class Expresso implements Drink {
  @override
  double getPrice() => 3.0;

  @override
  void serve() => print('>> Expresso');
}

/// Implementação concreta de [Drink]
class Tea implements Drink {
  @override
  double getPrice() => 1.5;

  @override
  void serve() => print('>> Chá');
}

/// Abstração que representa um decorator
///
/// Recebe o [drink] anterior, as implementações concretas deverão
/// retornar um novo drink a partir desse recebido
abstract class DrinkDecorator implements Drink {
  Drink drink;
  DrinkDecorator(this.drink);
}

class DoubleDrinkDec implements DrinkDecorator {
  @override
  Drink drink;

  /// Construtor
  DoubleDrinkDec(this.drink);

  @override
  double getPrice() => drink.getPrice() * 2;

  @override
  void serve() {
    drink.serve();
    print('>>> Add double');
  }
}

class ChocolateDec implements DrinkDecorator {
  @override
  Drink drink;

  /// Construtor
  ChocolateDec(this.drink);

  @override
  double getPrice() => drink.getPrice() + 2.5;

  @override
  void serve() {
    drink.serve();
    print('>>> Add chocolate');
  }
}

class MilkDec implements DrinkDecorator {
  @override
  Drink drink;

  /// Construtor
  MilkDec(this.drink);

  @override
  double getPrice() => drink.getPrice() + 1.5;

  @override
  void serve() {
    drink.serve();
    print('>>> Add milk');
  }
}
