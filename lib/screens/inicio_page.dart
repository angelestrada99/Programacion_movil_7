import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../provider/tema_provider.dart';
import '../responsive.dart';

class InicioPage extends StatefulWidget {
  @override
  _InicioPageState createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  final temaController = Get.put(TemaProvider());

  final imgPaleta = Image.asset(
    'assets/paleta.png',
    height: 100,
  );

  final spaceHoriz = SizedBox(
    height: 4.h,
  );

  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: Scaffold(
          appBar: AppBar(
            title: Text("Tema"),
          ),
          body: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        opacity: .6,
                        fit: BoxFit.cover,
                        image: AssetImage('assets/fondoTheme1.jpg'))),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                spaceHoriz,
                                spaceHoriz,
                                spaceHoriz,
                                spaceHoriz,
                                spaceHoriz,
                                spaceHoriz,
                                spaceHoriz,
                                spaceHoriz,
                                spaceHoriz,
                                spaceHoriz,
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
                                  onPressed: () =>
                                      temaController.temaPersonalizado(),
                                  child: const Text(
                                    'Tema personalizado',
                                  ),
                                ),
                                SizedBox(height: 10),
                                spaceHoriz,
                                spaceHoriz,
                                spaceHoriz,
                                spaceHoriz,
                                spaceHoriz,
                                spaceHoriz,
                                spaceHoriz,
                                spaceHoriz,
                                spaceHoriz,
                                spaceHoriz,
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        tablet: Scaffold(
          appBar: AppBar(
            title: Text("Tema"),
          ),
          body: Stack(
            children: [
              Container(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              imgPaleta,
                            ],
                          )),
                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                spaceHoriz,
                                spaceHoriz,
                                spaceHoriz,
                                spaceHoriz,
                                spaceHoriz,
                                spaceHoriz,
                                spaceHoriz,
                                spaceHoriz,
                                spaceHoriz,
                                spaceHoriz,
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
                                  onPressed: () =>
                                      temaController.temaPersonalizado(),
                                  child: const Text(
                                    'Tema personalizado',
                                  ),
                                ),
                                SizedBox(height: 10),
                                spaceHoriz,
                                spaceHoriz,
                                spaceHoriz,
                                spaceHoriz,
                                spaceHoriz,
                                spaceHoriz,
                                spaceHoriz,
                                spaceHoriz,
                                spaceHoriz,
                                spaceHoriz,
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        desktop: Scaffold(
          appBar: AppBar(
            title: Text("Tema"),
          ),
          body: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        opacity: .6,
                        fit: BoxFit.cover,
                        image: AssetImage('assets/fondoTheme3.jpg'))),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              imgPaleta,
                            ],
                          )),
                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                spaceHoriz,
                                spaceHoriz,
                                spaceHoriz,
                                spaceHoriz,
                                spaceHoriz,
                                spaceHoriz,
                                spaceHoriz,
                                spaceHoriz,
                                spaceHoriz,
                                spaceHoriz,
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
                                  onPressed: () =>
                                      temaController.temaPersonalizado(),
                                  child: const Text(
                                    'Tema personalizado',
                                  ),
                                ),
                                SizedBox(height: 10),
                                spaceHoriz,
                                spaceHoriz,
                                spaceHoriz,
                                spaceHoriz,
                                spaceHoriz,
                                spaceHoriz,
                                spaceHoriz,
                                spaceHoriz,
                                spaceHoriz,
                                spaceHoriz,
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
