import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_1/models/giph_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:math' as math;

class ListGifs extends StatefulWidget {
  const ListGifs({super.key});

  @override
  State<ListGifs> createState() => _ListGifsState();
}

class _ListGifsState extends State<ListGifs> {
  Uri link = Uri.parse(
      'https://api.giphy.com/v1/gifs/trending?api_key=i631WquqhIf9TUS6QtlKfHkQyOViCIXm&limit=72&rating=g');

  late Future<List<giphModel>?> _listadoGifs;

  Future<List<giphModel>?> _getGifs() async {
    var response = await http.get(link);
    List<giphModel> gifs = [];
    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(body);
      for (var item in jsonData["data"]) {
        gifs.add(giphModel(item["username"], item["rating"],
            item["images"]["downsized"]["url"]));
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
        title: const Text('GIFS'),
      ),
      body: FutureBuilder(
        future: _listadoGifs,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.count(
              crossAxisCount: 2,
              children: _listGifs(snapshot.data!),
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

  List<Widget> _listGifs(List<giphModel> data) {
    List<Widget> gifsW = [];
    for (var gif in data) {
      gifsW.add(Card(
          child: Column(
        children: [
          Text(gif.username!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                    .withOpacity(1.0),
              )),
          Text(
            'Rating: ' + gif.description!,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
              child: Image.network(
            gif.url!,
            fit: BoxFit.fill,
          )),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/moreAboutGiph');
            },
            child: const Text('More'),
            style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 95, 53, 5)),
          ),
        ],
      )));
    }
    return gifsW;
  }
}
