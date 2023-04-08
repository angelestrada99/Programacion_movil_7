import 'package:flutter/material.dart';
import 'package:flutter_1/database/database_helper.dart';
import 'package:flutter_1/models/popular_model.dart';
import 'package:flutter_1/provider/flags_provider.dart';
import 'package:provider/provider.dart';

class ItemPopular extends StatefulWidget {
  const ItemPopular({super.key, required this.popularModel});
  final PopularModel popularModel;

  @override
  State<ItemPopular> createState() => _ItemPopularState();
}

class _ItemPopularState extends State<ItemPopular> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    FlagsProvider flag = Provider.of<FlagsProvider>(context);
    return Stack(
      children: [
        Container(
          child: ClipRRect(
            child: FadeInImage(
              fit: BoxFit.fill,
              placeholder: const AssetImage('assets/loading2.gif'),
              image: NetworkImage(
                  'https://image.tmdb.org/t/p/w500/${widget.popularModel.posterPath}'),
            ),
          ),
        ),
        Positioned(
          top: 157.0,
          right: 85,
          child: FutureBuilder(
              future: databaseHelper.searchPopular(widget.popularModel.id!),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return IconButton(
                    icon: const Icon(Icons.favorite),
                    color: snapshot.data != true ? Colors.white : Colors.red,
                    iconSize: 52,
                    onPressed: () {
                      if (snapshot.data != true) {
                        databaseHelper
                            .INSERT(
                                'tblPopularFav', widget.popularModel!.toMap())
                            .then((value) => flag.setflagListPost());
                      } else {
                        databaseHelper
                            .DELETE(
                                'tblPopularFav', widget.popularModel.id!, 'id')
                            .then((value) => flag.setflagListPost());
                      }
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
      ],
    );
  }
}
