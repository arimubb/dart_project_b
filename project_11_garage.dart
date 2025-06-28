import 'dart:io';

class Car {
  String brand;
  String model;
  int year;
  String number;

  Car(this.brand, this.model, this.year, this.number);

  @override
  String toString() {
    return '"$brand" - $model ($year) - $number';
  }
}

class Garage {
  List<Car> cars = [];

  void addCar() {
    stdout.write("Добавьте машину. Введите модель машины : ");
    String? brand = stdin.readLineSync();

    if (brand == null || brand.trim().isEmpty) {
      print("Модель не введено.");
      return;
    }

    stdout.write("Введите марку машины: ");
    String? model = stdin.readLineSync();
    if (model == null || model.trim().isEmpty) {
      print("Марка не введена");
      return;
    }

    stdout.write("Введите госномер машины(пример: АС200): ");
    String? number = stdin.readLineSync();
    if (number == null || number.trim().isEmpty) {
      print("госномер не введен");
      return;
    }

    stdout.write("Введите год машины: ");
    String? yearStr = stdin.readLineSync();

    if (yearStr == null ||
        yearStr.trim().isEmpty ||
        int.tryParse(yearStr) == null) {
      print("Год некорректный");
      return;
    }
    int year = int.parse(yearStr.trim());

    cars.add(Car(brand.trim(), model.trim(), year, number.trim()));
    print("Машина '$brand - $model - $number' добавлена");
  }

  Car? findCar(String number) {
    for (var car in cars) {
      if (car.number == number) {
        return car;
      }
    }
    return null;
  }

  void listAllCars() {
    if (cars.isEmpty) {
      print("Нет машин");
    } else {
      print("Список всех машин: ");
      for (var i = 0; i < cars.length; i++) {
        print("${i + 1}. ${cars[i]}");
      }
    }
  }

  void removeCar() {
    listAllCars();
    if (cars.isEmpty) return;

    stdout.write("Введите номер машины по списку для удаления: ");
    String? input = stdin.readLineSync();
    int? index = int.tryParse(input ?? '');

    if (index != null && index > 0 && index <= cars.length) {
      Car removed = cars.removeAt(index - 1);
      print("Удалена машина: $removed");
    } else {
      print("Неверный номер");
    }
  }
}

void main() {
  Garage read = Garage();
  var duration = Duration(seconds: 2);
  while (true) {
    print("===== МЕНЮ =====");
    print("1. Добавить машину.");
    print("2. Найти машину.");
    print("3. Посмотреть все машины.");
    print("4. Удалить машину.");
    print("5. Выход");

    stdout.write("Ваш выбор: ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case "1":
        read.addCar();
        break;
      case "2":
        stdout.write("Введите номер машины: ");
        String? search = stdin.readLineSync();

        if (search == null || search.trim().isEmpty) {
          print("Не введено название. ");
          break;
        }
        Car? car = read.findCar(search.trim());

        if (car != null) {
          print("Найдена книга: $car");
        } else {
          print("Не найдена.");
        }
        break;

      case "3":
        read.listAllCars();
        break;
      case "4":
        read.removeCar();
        break;
      case "5":
        print("Выход.");
        sleep(duration);
        return;
      default:
        print("Неизвестный выбор.");
    }
  }
}
