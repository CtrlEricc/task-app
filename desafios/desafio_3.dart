import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

void main() async {
  await getCatFact();
}

Future<void> getCatFact() async {
  // get a ramdom fact about cats
  final url = Uri.parse('https://catfact.ninja/fact');

  print('Carregando fato aleatório sobre gatos...');

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final String fact = jsonData['fact'];
      print('Fato aleatório sobre gatos: $fact');
    } else {
      print('Erro: Não foi possível obter o fato sobre gatos. Código HTTP: ${response.statusCode}');
    }
  } on SocketException {
    print('Erro: Sem conexão com a internet.');
  } catch (e) {
    print('Erro: Algo deu errado. Detalhes: $e');
  }
}
