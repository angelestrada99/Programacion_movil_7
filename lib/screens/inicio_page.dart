import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../provider/tema_provider.dart';
import '../responsive.dart';

class InicioPage extends StatefulWidget {
  @override
  _InicioPageState createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  final temaController = Get.put(TemaProvider());

  final imglogo = Image.asset(
    'assets/bmw.png',
    height: 100,
  );

  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: Scaffold(
            appBar: AppBar(
              title: Text("Tema"),
            ),
            body: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => temaController.temaClaro(),
                  child: const Text(
                    'Tema claro',
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => temaController.temaObscuro(),
                  child: const Text(
                    'Tema obscuro',
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => temaController.temaPersonalizado(),
                  child: const Text(
                    'Tema personalizado',
                  ),
                ),
                SizedBox(height: 10),
              ],
            ))),
        tablet: Scaffold(
            appBar: AppBar(
              title: Text("Tema"),
            ),
            body: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => temaController.temaClaro(),
                  child: const Text(
                    'Tema claro',
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => temaController.temaObscuro(),
                  child: const Text(
                    'Tema obscuro',
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => temaController.temaPersonalizado(),
                  child: const Text(
                    'Tema personalizado',
                  ),
                ),
                SizedBox(height: 10),
              ],
            ))),
        desktop: Scaffold(
            appBar: AppBar(
              title: Text("Tema"),
            ),
            body: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => temaController.temaClaro(),
                  child: const Text(
                    'Tema claro',
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => temaController.temaObscuro(),
                  child: const Text(
                    'Tema obscuro',
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => temaController.temaPersonalizado(),
                  child: const Text(
                    'Tema personalizado',
                  ),
                ),
                SizedBox(height: 10),
              ],
            ))));
  }
}
