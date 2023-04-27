import 'package:flutter/material.dart';
import 'package:flutter_1/screens/list_favorites_cloud.dart';

class BestMovies extends StatefulWidget {
  const BestMovies({super.key});

  @override
  State<BestMovies> createState() => _BestMoviesState();
}

class _BestMoviesState extends State<BestMovies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Best movies'),
      ),
      body: const ListFavoritesCloud(),
    );
  }
}
