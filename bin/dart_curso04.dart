// Objetivos do projeto na Aula 02:
// 1 - Criar classe Movie para representar nossos filmes
// 2 - Indagar-se a questão: "Como registrar e ler um objeto de forma textual?"
// 3 - Usar o JSON para gravar um filme no arquivo

// Explicar o que é isso
import 'dart:io';

// Explicar o que é esse "as"
import 'package:path/path.dart' as path;

import 'models/movie.dart';

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

  print("Qual o nome do filme?");
  String? name = stdin.readLineSync();

  print("Que nota você daria para esse filme? (0 a 5)");
  String? ratingInput = stdin.readLineSync();

  print("Adicione uma curta observação para esse filme:");
  String? notes = stdin.readLineSync();

  print("Qual dia você assistiu esse filme? (AAAA-MM-DD ou 0 para agora)");
  String? whenWatchedInput = stdin.readLineSync();

  if (name != null &&
      ratingInput != null &&
      notes != null &&
      whenWatchedInput != null) {
    DateTime whenWatched = DateTime.now();
    if (whenWatchedInput != "0") {
      whenWatched = DateTime.parse(whenWatchedInput);
    }
    int rating = int.parse(ratingInput);
    Movie movie = Movie(name, rating, notes, whenWatched);

    print(movie);
    print(movie.toMap());
    print(movie.toJson());

    saveMovieFile(movie);
  } else {
    print("Desculpe, algo aconteceu! Tente novamente!");
  }
}

saveMovieFile(Movie movie) {
  // Definir um diretório -> Gancho para instalar o path
  Directory directory = Directory.current;

  // Definir um novo arquivo
  String filePath = path.join(directory.path, "my_movies.json");

  // Abrir o arquivo no File
  File file = File(filePath);

  // Salvar qualquer coisa
  file.writeAsStringSync(movie.toJson());

  print("Filme adicionado com sucesso!");
}

loadMovies() {
  print("Mostrar lista de filmes.");
}
