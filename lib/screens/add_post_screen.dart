import 'package:flutter/material.dart';
import 'package:flutter_1/database/database_helper.dart';

class AddPostScreen extends StatelessWidget {
  AddPostScreen({super.key});

  DatabaseHelper database = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    final txtConPost = TextEditingController();
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(15),
          height: 350,
          decoration: BoxDecoration(
              color: Colors.green, border: Border.all(color: Colors.black)),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Add post'),
              TextFormField(
                controller: txtConPost,
                maxLines: 8,
              ),
              ElevatedButton(
                  onPressed: () {
                    database.INSERT('tblPost', {
                      'dscPost': txtConPost.text,
                      'datePost': DateTime.now().toString()
                    }).then((value) {
                      var msg =
                          value > 0 ? 'Registro insertado' : 'Ocurrio un error';
                      var snackBar = SnackBar(content: Text(msg));
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    });
                  },
                  child: const Text('Save post'))
            ],
          ),
        ),
      ),
    );
  }
}
