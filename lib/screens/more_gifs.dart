import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_1/models/more_giph_model.dart';
import 'package:http/http.dart' as http;

class MoreGifs extends StatefulWidget {
  const MoreGifs({super.key});

  @override
  State<MoreGifs> createState() => _MoreGifsState();
}

class _MoreGifsState extends State<MoreGifs> {
  Uri link = Uri.parse(
      'https://api.giphy.com/v1/gifs/trending?api_key=i631WquqhIf9TUS6QtlKfHkQyOViCIXm&limit=95&rating=r');

  late Future<List<moreGiphModel>?> _listadoGifs;

  Future<List<moreGiphModel>?> _getGifs() async {
    var response = await http.get(link);
    List<moreGiphModel> gifs = [];
    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(body);
      for (var item in jsonData["data"]) {
        gifs.add(moreGiphModel(item["images"]["original"]["url"]));
      }
      return gifs;
    } else {
      throw Exception("Ocurrio un error");
    }
  }

  @override
  void initState() {
    super.initState();
    _listadoGifs = _getGifs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('More gifs'),
      ),
      body: FutureBuilder(
        future: _listadoGifs,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.count(
              crossAxisCount: 5,
              children: _MoreGifs(snapshot.data!),
            );
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return const Text("Error");
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }

  List<Widget> _MoreGifs(List<moreGiphModel> data) {
    List<Widget> gifsW = [];
    for (var gif in data) {
      gifsW.add(Card(
          child: Column(
        children: [
          Expanded(
              child: Image.network(
            gif.url!,
            fit: BoxFit.fill,
          )),
        ],
      )));
    }
    return gifsW;
  }
}
