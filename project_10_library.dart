import 'dart:io';

class Book {
  String title;
  String author;
  int year;

  Book(this.title, this.author, this.year);

  @override
  String toString() {
    return '"$title" — $author ($year)';
  }
}

class Library {
  List<Book> books = [];

  void addBook() {
    stdout.write("Добавите книгу. Введите название книги: ");
    String? title = stdin.readLineSync();

    if (title == null || title.trim().isEmpty) {
      print("Название не введено.");
      return;
    }
    stdout.write("Введите автора книги: ");
    String? author = stdin.readLineSync();
    if (author == null || author.trim().isEmpty) {
      print("Автор не введен.");
      return;
    }
    stdout.write("Введите год издания книги: ");
    String? yearStr = stdin.readLineSync();

    if (yearStr == null ||
        yearStr.trim().isEmpty ||
        int.tryParse(yearStr) == null) {
      print("Год издания некорректный.");
      return;
    }
    int year = int.parse(yearStr.trim());

    books.add(Book(title.trim(), author.trim(), year));
    print('Книга "$title" добавлена!');
  }

  Book? findBook(String title) {
    for (var book in books) {
      if (book.title == title) {
        return book;
      }
    }
    return null;
  }

  void listAllBook() {
    if (books.isEmpty) {
      print("Нет книг.");
    } else {
      print("Список всех книг:");
      for (var i = 0; i < books.length; i++) {
        print("${i + 1}. ${books[i]}");
      }
    }
  }
}

void main() {
  Library read = Library();
  var duration = Duration(seconds: 3);
  while (true) {
    print("===== МЕНЮ =====");
    print("1. Добавить книгу.");
    print("2. Найти книгу.");
    print("3. Посмотреть все книги.");
    print("4. Выйти.");

    stdout.write("Ваш выбор: ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case "1":
        read.addBook();
        break;
      case "2":
        stdout.write("Введите название книги для поиска: ");
        String? search = stdin.readLineSync();

        if (search == null || search.trim().isEmpty) {
          print("Не введено название.");
          break;
        }
        Book? book = read.findBook(search.trim());

        if (book != null) {
          print("Найдена книга: $book");
        } else {
          print("Не найдена.");
        }
        break;
      case "3":
        read.listAllBook();
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
