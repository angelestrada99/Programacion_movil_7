import 'dart:convert';
import 'package:flutter_1/models/actor_model.dart';
import 'package:flutter_1/models/popular_model.dart';
import 'package:http/http.dart' as http;

class ApiPopular {
  Uri link = Uri.parse(
      'https://api.themoviedb.org/3/movie/popular?api_key=0cb894064f40656f3575e8ccae3d8d73&language=es-MX&page=1');

  Future<List<PopularModel>?> getAllPopular() async {
    var result = await http.get(link);
    var listJSON = jsonDecode(result.body)['results'] as List;
    if (result.statusCode == 200) {
      return listJSON.map((popular) => PopularModel.fromMap(popular)).toList();
    }
    return null;
  }

  Future<String> getIdVideo(int id_popular) async {
    Uri auxVideo = Uri.parse('https://api.themoviedb.org/3/movie/' +
        id_popular.toString() +
        '/videos?api_key=d7236b730825fb7b3c7e23e7d91e473c');
    var result = await http.get(auxVideo);
    var listJSON = jsonDecode(result.body)['results'] as List;
    if (result.statusCode == 200) {
      print(listJSON[0]['key']);
      return listJSON[0]['key'];
    }
    return '';
  }

  Future<List<ActorModel>?> getCast(PopularModel popularModel) async {
    Uri auxActores = Uri.parse('https://api.themoviedb.org/3/movie/' +
        popularModel.id.toString() +
        '/credits?api_key=d7236b730825fb7b3c7e23e7d91e473c');
    var result = await http.get(auxActores);
    var listJSON = jsonDecode(result.body)['cast'] as List;
    if (result.statusCode == 200) {
      return listJSON.map((actor) => ActorModel.fromMap(actor)).toList();
    }
    return null;
  }
}
