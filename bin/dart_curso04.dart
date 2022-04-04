// Objetivos do projeto na Aula 01:
// 1 - Introduzir o problema (de Dandara) que o projeto resolve
// 2 - Fazer a estrutura de navegação
// 3 - Explicar sobre Bibliotecas, Dependências e Pacotes.

// Explicar o que é isso
import 'dart:io';

// Explicar o que é esse "as"
import 'package:path/path.dart' as path;

void main() {
  print("| Catálogo de Filmes da Dandara |");

  bool continueLoop = true;
  while (continueLoop) {
    print("\nO que deseja fazer a seguir?"); // Explicar a quebra de linha.
    print("1 - Adicionar filme ao catálogo");
    print("2 - Ver catálogo completo");
    print("0 - Sair");
    String? input = stdin.readLineSync();
    if (input != null) {
      switch (input) {
        case "1":
          {
            saveMovie();
            break;
          }
        case "2":
          {
            loadMovies();
            break;
          }
        case "0":
          {
            continueLoop = false;
            break;
          }
        default:
          {
            print("Comando incorreto.");
            break;
          }
      }
    } else {
      print("Comando incorreto.");
    }
  }
}

saveMovie() {
  print("Gravar um filme.");

  // Definir um diretório -> Gancho para instalar o path
  Directory directory = Directory.current;
  print(directory);
  print(directory.path);

  // Definir um novo arquivo
  String filePath = path.join(directory.path, "my_films.txt");

  // Abrir o arquivo no File
  File file = File(filePath);

  // Salvar qualquer coisa
  file.writeAsStringSync("Aqui serão gravados nossos filmes");
}

loadMovies() {
  print("Mostrar lista de filmes.");
}
