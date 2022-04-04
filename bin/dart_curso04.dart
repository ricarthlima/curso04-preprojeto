// Objetivos do projeto na Aula 04:
// 1 - Refatorar o código
// 2 - Criar classe FileManager
// 3 - Criar

// Explicar o que é isso
import 'dart:io';

// Explicar o que é esse "as"
import 'package:path/path.dart' as path;

import 'models/movie.dart';

void main() {
  print("| Catálogo de Filmes da Dandara |");
  printMenu();
}

printMenu() async {
  bool continueLoop = true;

  print("\nO que deseja fazer a seguir?"); // Explicar a quebra de linha.
  print("1 - Adicionar filme ao catálogo");
  print("2 - Ver catálogo completo");
  print("0 - Sair");
  String? input = stdin.readLineSync();
  if (input != null) {
    switch (input) {
      case "1":
        {
          await saveMovie();
          break;
        }
      case "2":
        {
          await loadMovies();
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

  if (continueLoop) {
    printMenu();
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

loadMovies() async {}
