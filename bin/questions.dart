import 'dart:io';

class Questions {
  /// Question 1
  /// Buatlah fungsi dengan input N dan output list fibonacci (point 25)
  /// contoh : input 5 output 011235
  void question1() {
    try {
      print('List fibonacci');
      print('Input N');

      final int n = int.parse(stdin.readLineSync()!);
      final List<int> fibonacciResult = [];

      for (int i = 0; i <= n; i++) {
        fibonacciResult.add(_fibonacci(i));
      }

      final String result = fibonacciResult.join(', ');

      print('List Fibonacci : $result');
    } catch (e) {
      print('Error : $e');
    }
  }

  int _fibonacci(int n) {
    if (n == 0 || n == 1) return n;
    return _fibonacci(n - 1) + _fibonacci(n - 2);
  }

  /// Question 2
  /// Buatlah fungsi untuk input sebuah string dan mengembalikan nilai boolean apakah string
  /// tersebut termasuk palindrom (point 25)
  /// contoh : input katak output true
  void question2() {
    print('Palindrom');
    print('Input Palindrom');

    final String? input = stdin.readLineSync();
    final String reverse = input!.split('').reversed.join('');

    final bool result = (input == reverse) ? true : false;

    print('Output : $result');
  }

  /// Question 3
  /// Buatlah fungsi untuk sort list data array (point 20)
  /// contoh : input 5,3,7,8 output 3,5,7,8
  void question3() {
    print('Sorting');

    final List<String> list = [];

    String? input;

    do {
      print('Input');
      input = stdin.readLineSync();

      if (input != '') {
        list.add(input!);
      }
    } while (input != '');

    final List<int> sorted = list.map(int.parse).toList()..sort();

    print('Output : $sorted');
  }

  /// Question 4
  /// Buat fungsi dengan input array string dan output kata kata yang termasuk anagram
  /// contoh : input aku,makan, kua, kau, muka, kamu
  /// output
  /// [
  ///   [aku, kau, kua],
  ///   [muka, kamu],
  ///   [makan]
  /// ]
  void question4() {
    print('Anagram');

    List<String> list = [];
    String? input;

    do {
      print('Input');
      input = stdin.readLineSync();

      if (input != '') {
        list.add(input!);
      }
    } while (input != '');

    final List<List<String>> result = _anagrams(list);

    print('Output : $result');
  }

  List<List<String>> _anagrams(List<String> params) {
    Map<String, List<String>> anagramMap = {};

    for (String param in params) {
      String sortedKata = _sortString(param);

      if (!anagramMap.containsKey(sortedKata)) {
        anagramMap[sortedKata] = [param];
      } else {
        anagramMap[sortedKata]!.add(param);
      }
    }

    List<List<String>> groupedAnagrams = anagramMap.values.toList();
    return groupedAnagrams;
  }

  String _sortString(String param) {
    List<String> characters = param.split('');
    characters.sort();
    return characters.join();
  }

  // Pilih soal
  void init() {
    print('Pilih soal 1 s/d 4');
    final String? input = stdin.readLineSync();

    switch (input) {
      case '1':
        question1();
        break;
      case '2':
        question2();
        break;
      case '3':
        question3();
        break;
      case '4':
        question4();
        break;
      default:
        print('Tidak yang di pilihan');
    }
  }
}
