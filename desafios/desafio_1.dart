import 'dart:io';

void main() {
  List<int> numbers = [];

  print("O algoritmo irá calcular o maior número, o menor número e a soma de todos os números.");
  print(
      "Digite um número inteiro e pressione 'enter' para adicionar o próximo. Digite 'fim' e pressione 'enter' para finalizar:");

  while (true) {
    String? entry = stdin.readLineSync();
    if (entry == null || entry.toLowerCase() == 'fim') {
      break;
    }
    try {
      int number = int.parse(entry);
      numbers.add(number);
    } catch (e) {
      print("Entrada inválida. Por favor, insira um número inteiro ou 'fim' para terminar");
    }
  }

  if (numbers.isEmpty) {
    print('A lista está vazia. Nenhum cálculo será realizado');
    return;
  }

  List<dynamic> result = processNumbers(numbers);

  print('Maior número: ${result[0]}');
  print('Menor número: ${result[1]}');
  print('Soma: ${result[2]}');
}

List<dynamic> processNumbers(List<int> numbers) {
  int largestNumber = numbers.reduce((a, b) => a > b ? a : b);
  int smallestNumber = numbers.reduce((a, b) => a < b ? a : b);
  int sum = numbers.reduce((a, b) => a + b);

  return [largestNumber, smallestNumber, sum];
}
