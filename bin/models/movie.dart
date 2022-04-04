// Explicar pq a pasta se chama "Models"

import 'dart:convert';

class Movie {
  // Explicar o propósito do late
  late String name;
  late int rating;
  late String notes;
  late DateTime whenWatched;

  Movie(this.name, this.rating, this.notes, this.whenWatched);

  // Explicar o propósito desse método
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map["name"] = name;
    map["rating"] = rating;
    map["notes"] = notes;
    map["whenWatched"] = whenWatched.toString();
    return map;
  }

  // Explicar o propósito desse método
  String toJson() {
    return json.encode(toMap());
  }

  @override
  String toString() {
    return "Eu assisti o filme $name no dia $whenWatched, eu dei $rating/5.";
  }
}
