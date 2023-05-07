//AIzaSyDwDaSmP_Lr6KDeCi1URli1V4VDlL1SEbs  | AIzaSyC-tHuT1vc_hxGg99Wn1hsjzdzaaV2pubI
import 'package:flutter/material.dart';
import 'package:flutter_1/firebase/favorites_firebase.dart';

class ListFavoritesCloud extends StatefulWidget {
  const ListFavoritesCloud({super.key});

  @override
  State<ListFavoritesCloud> createState() => _ListFavoritesCloudState();
}

class _ListFavoritesCloudState extends State<ListFavoritesCloud> {
  FavoritesFirebase _firebase = FavoritesFirebase();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: _firebase.gatAllFavorites(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return Container(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Text(snapshot.data!.docs[index].get('tittle')),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {
/*                                 _firebase.insFavorite({
                                  'tittle':
                                      snapshot.data!.docs[index].get('tittle'),
                                }); */
                              },
                              icon: Icon(Icons.favorite)),
                          IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text('Confirmar Borrado'),
                                    content: const Text(
                                        'Deseas borrar de favoritos'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            _firebase.delFavorite(
                                                snapshot.data!.docs[index].id);
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Si')),
                                      TextButton(
                                          onPressed: () {},
                                          child: const Text('No'))
                                    ],
                                  ),
                                );
                              },
                              icon: Icon(Icons.delete)),
                        ],
                      )
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error en la peticion, intentelo de nuevo'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
