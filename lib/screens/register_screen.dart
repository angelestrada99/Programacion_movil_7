import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../provider/theme_provider.dart';
import '../responsive.dart';
import '../settings/styles_settings.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isDarkModeEnabled = false;
  final _keyForm = GlobalKey<FormState>();

  bool isLoading = false;

  final imglogo = Image.asset(
    'assets/bmw.png',
    height: 90,
  );

  final tittle = Text(
    'CREAR CUENTA',
    textAlign: TextAlign.center,
    style: TextStyle(
        fontSize: 20.sp,
        color: Color.fromARGB(255, 255, 255, 255),
        fontStyle: FontStyle.italic),
  );

  var imgProfile = Image.asset(
    'assets/profile.png',
    height: 127.h,
  );

  File? imagen = null;

  final picker = ImagePicker();

  Future selImagen(op) async {
    var pickerFile;
    if (op == 1) {
      pickerFile = await picker.pickImage(source: ImageSource.camera);
    } else {
      pickerFile = await picker.pickImage(source: ImageSource.gallery);
    }
    setState(() {
      if (pickerFile != null) {
        imagen = File(pickerFile.path);
        print('Imagen cargada');
      } else {
        print('Imagen no especificada');
      }
    });
  }

  opciones(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: const EdgeInsets.all(0),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      selImagen(1);
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 2, color: Colors.grey))),
                      child: const Row(
                        children: [
                          Expanded(
                            child: Text('Tomar fotografia'),
                          ),
                          Icon(Icons.camera_alt)
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      selImagen(2);
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: const Row(
                        children: [
                          Expanded(
                            child: Text('Subir fotografia'),
                          ),
                          Icon(Icons.folder)
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                      setState(() {});
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 117, 209, 74)),
                      child: const Row(
                        children: [
                          Expanded(
                            child: Text(
                              'OK',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  final txtName = TextFormField(
    validator: (value) {
      if (value!.isEmpty) {
        return "Campo obligatorio*";
      }
      if (value.characters.contains('1') == true) {
        return "Este campo no debe contener numeros";
      }
      if (value.characters.contains('2') == true) {
        return "Este campo no debe contener numeros";
      }
      if (value.characters.contains('3') == true) {
        return "Este campo no debe contener numeros";
      }
      if (value.characters.contains('4') == true) {
        return "Este campo no debe contener numeros";
      }
      if (value.characters.contains('5') == true) {
        return "Este campo no debe contener numeros";
      }
      if (value.characters.contains('6') == true) {
        return "Este campo no debe contener numeros";
      }
      if (value.characters.contains('7') == true) {
        return "Este campo no debe contener numeros";
      }
      if (value.characters.contains('8') == true) {
        return "Este campo no debe contener numeros";
      }
      if (value.characters.contains('9') == true) {
        return "Este campo no debe contener numeros";
      }
      return null;
    },
    decoration: InputDecoration(
      labelText: "Nombre(s) *",
      labelStyle: TextStyle(
          color: Colors.white, fontSize: 10.sp, fontWeight: FontWeight.w300),
    ),
  );

  final txtApe = TextFormField(
    validator: (value) {
      if (value!.isEmpty) {
        return "Campo obligatorio*";
      }
      if (value.characters.contains('1') == true) {
        return "Este campo no debe contener numeros";
      }
      if (value.characters.contains('2') == true) {
        return "Este campo no debe contener numeros";
      }
      if (value.characters.contains('3') == true) {
        return "Este campo no debe contener numeros";
      }
      if (value.characters.contains('4') == true) {
        return "Este campo no debe contener numeros";
      }
      if (value.characters.contains('5') == true) {
        return "Este campo no debe contener numeros";
      }
      if (value.characters.contains('6') == true) {
        return "Este campo no debe contener numeros";
      }
      if (value.characters.contains('7') == true) {
        return "Este campo no debe contener numeros";
      }
      if (value.characters.contains('8') == true) {
        return "Este campo no debe contener numeros";
      }
      if (value.characters.contains('9') == true) {
        return "Este campo no debe contener numeros";
      }
      return null;
    },
    decoration: InputDecoration(
      labelText: "Apellidos *",
      labelStyle: TextStyle(
          color: Colors.white, fontSize: 10.sp, fontWeight: FontWeight.w300),
    ),
  );

  final txtEmail = TextFormField(
    validator: (value) {
      if (value!.isEmpty || !(EmailValidator.validate(value))) {
        return "Se requiere ingresar un correo valido";
      }
      return null;
    },
    decoration: InputDecoration(
      labelText: "Email *",
      hintText: "example@gmail.com",
      hintStyle: TextStyle(color: Colors.grey, fontSize: 15.sp),
      labelStyle: TextStyle(
          color: Colors.white, fontSize: 10.sp, fontWeight: FontWeight.w300),
      prefixIcon: const Icon(
        Icons.email_outlined,
        color: Colors.white,
      ),
    ),
  );

  final txtPass = TextFormField(
    obscureText: true,
    validator: (value) {
      if (value!.isEmpty) {
        return "Campo obligatorio*";
      }
      if (value.length < 4) {
        return "Se requiere una contraseña mas fuerte";
      }
      return null;
    },
    decoration: InputDecoration(
      labelText: "New password *",
      labelStyle: TextStyle(
          color: Colors.white, fontSize: 10.sp, fontWeight: FontWeight.w300),
      prefixIcon: const Icon(
        Icons.password_outlined,
        color: Colors.white,
      ),
    ),
  );

  final spaceHoriz = SizedBox(
    height: 4.h,
  );

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context);
    return Responsive(
      mobile: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      opacity: .6,
                      fit: BoxFit.cover,
                      image: AssetImage('assets/portadaLogin.jpg'))),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Form(
                      key: _keyForm,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          spaceHoriz,
                          spaceHoriz,
                          tittle,
                          spaceHoriz,
                          //imgProfile,
                          imagen != null
                              ? imgProfile = Image.file(
                                  imagen!,
                                  height: 27.h,
                                )
                              : const Center(),
                          spaceHoriz,
                          ElevatedButton(
                            onPressed: () {
                              opciones(context);
                            },
                            child: const Text(
                              'Añadir foto de perfil',
                            ),
                          ),
                          spaceHoriz,
                          txtName,
                          spaceHoriz,
                          txtApe,
                          spaceHoriz,
                          txtEmail,
                          spaceHoriz,
                          txtPass,
                          spaceHoriz,
                          ElevatedButton(
                            onPressed: () {
                              if (_keyForm.currentState!.validate()) {
                                print('Validacion exitosa');
                              } else {
                                print('Validacion erronea');
                              }
                            },
                            child: const Text(
                              'Crear cuenta',
                            ),
                          ),
                          spaceHoriz,
                          DayNightSwitcher(
                            isDarkModeEnabled: isDarkModeEnabled,
                            onStateChanged: (isDarkModeEnabled) {
                              isDarkModeEnabled
                                  ? theme.setthemeData(
                                      StylesSettings.darkTheme(context))
                                  : theme.setthemeData(
                                      StylesSettings.lightTheme(context));
                              this.isDarkModeEnabled = isDarkModeEnabled;
                              setState(() {});
                            },
                          ),
                          spaceHoriz,
                          spaceHoriz,
                          spaceHoriz
                        ],
                      ),
                    ), //Positioned(top:100, child: imglogo)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      tablet: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      opacity: .6,
                      fit: BoxFit.cover,
                      image: AssetImage('assets/FondoTablet.jpg'))),
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
                            imglogo,
                          ],
                        )),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              spaceHoriz,
                              spaceHoriz,
                              tittle,
                              spaceHoriz,
                              //imgProfile,
                              imagen != null
                                  ? imgProfile = Image.file(
                                      imagen!,
                                      height: 27.h,
                                    )
                                  : const Center(),
                              spaceHoriz,
                              ElevatedButton(
                                onPressed: () {
                                  opciones(context);
                                },
                                child: const Text(
                                  'Añadir foto de perfil',
                                ),
                              ),
                              spaceHoriz,
                              txtName,
                              spaceHoriz,
                              txtApe,
                              spaceHoriz,
                              txtEmail,
                              spaceHoriz,
                              txtPass,
                              spaceHoriz,
                              ElevatedButton(
                                onPressed: () {
                                  if (_keyForm.currentState!.validate()) {
                                    print('Validacion exitosa');
                                  } else {
                                    print('Validacion erronea');
                                  }
                                },
                                child: const Text(
                                  'Crear cuenta',
                                ),
                              ),
                              spaceHoriz,
                              DayNightSwitcher(
                                isDarkModeEnabled: isDarkModeEnabled,
                                onStateChanged: (isDarkModeEnabled) {
                                  isDarkModeEnabled
                                      ? theme.setthemeData(
                                          StylesSettings.darkTheme(context))
                                      : theme.setthemeData(
                                          StylesSettings.lightTheme(context));
                                  this.isDarkModeEnabled = isDarkModeEnabled;
                                  setState(() {});
                                },
                              ),
                              spaceHoriz,
                              spaceHoriz,
                              spaceHoriz
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
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      opacity: .6,
                      fit: BoxFit.cover,
                      image: AssetImage('assets/FondoDesktop.jpg'))),
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
                            imglogo,
                          ],
                        )),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              spaceHoriz,
                              spaceHoriz,
                              tittle,
                              spaceHoriz,
                              //imgProfile,
                              imagen != null
                                  ? imgProfile = Image.file(
                                      imagen!,
                                      height: 27.h,
                                    )
                                  : const Center(),
                              spaceHoriz,
                              ElevatedButton(
                                onPressed: () {
                                  opciones(context);
                                },
                                child: const Text(
                                  'Añadir foto de perfil',
                                ),
                              ),
                              spaceHoriz,
                              txtName,
                              spaceHoriz,
                              txtApe,
                              spaceHoriz,
                              txtEmail,
                              spaceHoriz,
                              txtPass,
                              spaceHoriz,
                              ElevatedButton(
                                onPressed: () {
                                  if (_keyForm.currentState!.validate()) {
                                    print('Validacion exitosa');
                                  } else {
                                    print('Validacion erronea');
                                  }
                                },
                                child: const Text(
                                  'Crear cuenta',
                                ),
                              ),
                              spaceHoriz,
                              DayNightSwitcher(
                                isDarkModeEnabled: isDarkModeEnabled,
                                onStateChanged: (isDarkModeEnabled) {
                                  isDarkModeEnabled
                                      ? theme.setthemeData(
                                          StylesSettings.darkTheme(context))
                                      : theme.setthemeData(
                                          StylesSettings.lightTheme(context));
                                  this.isDarkModeEnabled = isDarkModeEnabled;
                                  setState(() {});
                                },
                              ),
                              spaceHoriz,
                              spaceHoriz,
                              spaceHoriz
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
    );
  }
}
