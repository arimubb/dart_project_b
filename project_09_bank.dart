import 'dart:io';

class BankAccount {
  double balance = 0;

  void deposit() {
    stdout.write("Введите пароль: ");
    String? password = stdin.readLineSync();

    if (password != null && password == "2954") {
      stdout.write("Введите сумму пополнения: ");
      String? amountStr = stdin.readLineSync();

      if (amountStr == null) {
        print("Сумма не введена.");
        return;
      }
      try {
        double amount = double.parse(amountStr);
        if (amount <= 0) {
          print("Сумма должны быть положительной.");
          return;
        }
        balance += amount;
        print("Пополнение на $amount выполнено. Текущий баланс: $balance.");
      } catch (e) {
        print("Ошибка: нужно ввести число.");
      }
    } else {
      print("Неверный пароль.");
    }
  }

  void withdraw() {
    if (balance == 0) {
      print("На счете недостаточно средств.");
      return;
    }
    stdout.write("Введите сумму для снятия: ");
    String? amountStr = stdin.readLineSync();

    if (amountStr == null) {
      print("Сумма не введена.");
      return;
    }
    try {
      double amount = double.parse(amountStr);
      if (amount <= 0) {
        print("Сумма должны быть положительной.");
        return;
      }
      if (amount > balance) {
        print("На счете недостаточно средств.");
        return;
      }
      balance -= amount;
      print("Снято $amount. Текущий баланс: $balance.");
    } catch (e) {
      print("Ошибка: нужно ввести число.");
    }
  }

  void showBalance() {
    print("Текущий баланс: $balance.");
  }
}

void main() {
  BankAccount account = BankAccount();

  var duration = Duration(seconds: 3);
  while (true) {
    print("===== МЕНЮ =====");
    print("1. Пополнить счет.");
    print("2. Снять деньги.");
    print("3. Просмотреть баланс.");
    print("4. Выйти.");

    stdout.write("Ваш выбор: ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case "1":
        account.deposit();
        break;
      case "2":
        account.withdraw();
        break;
      case "3":
        account.showBalance();
        break;
      case "4":
        print("Выход.");
        sleep(duration);
        return;
      default:
        print("Неизвестный выбор.");
    }
  }
}
