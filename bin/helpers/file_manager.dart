import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:uuid/uuid.dart';
import '../models/movie.dart';

class FileManager {
  String currentPath = Directory.current.path;
  late File file;

  FileManager({required String filePath}) {
    file = File(path.join(currentPath, filePath));
  }

  FileManager.withPath(String customPath, String filePath) {
    file = File(path.join(customPath, filePath));
  }

  verifyExistence() async {
    bool exists = await file.exists();
    if (!exists) {
      file.writeAsString("{}");
    }
  }

  Future<Map<String, dynamic>> readJSON() async {
    String value = await file.readAsString();
    return json.decode(value);
  }

  addMovie(Movie movie) async {
    Map<String, dynamic> map = await readJSON();
    map[Uuid().v1()] = movie.toMap();
    await file.writeAsString(json.encode(map));
  }
}
