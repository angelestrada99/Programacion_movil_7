import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _keyForm = GlobalKey<FormState>();

  bool isLoading = false;

  final imglogo = Image.asset(
    'assets/bmw.png',
    height: 90,
  );

  final tittle = const Text(
    'CREAR CUENTA',
    textAlign: TextAlign.center,
    style: TextStyle(
        fontSize: 50,
        color: Color.fromARGB(255, 255, 255, 255),
        fontStyle: FontStyle.italic),
  );

  var imgProfile = Image.asset(
    'assets/profile.png',
    height: 127,
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
            contentPadding: EdgeInsets.all(0),
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
                      decoration: BoxDecoration(
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
    decoration: const InputDecoration(
      labelText: "Nombre(s) *",
      labelStyle: const TextStyle(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.w300),
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
    decoration: const InputDecoration(
      labelText: "Apellidos *",
      labelStyle: const TextStyle(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.w300),
    ),
  );

  final txtEmail = TextFormField(
    validator: (value) {
      if (value!.isEmpty || !(EmailValidator.validate(value))) {
        return "Se requiere ingresar un correo valido";
      }
      return null;
    },
    decoration: const InputDecoration(
      labelText: "Email *",
      hintText: "example@gmail.com",
      hintStyle: const TextStyle(color: Colors.grey, fontSize: 15),
      labelStyle: const TextStyle(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.w300),
      prefixIcon: const Icon(
        Icons.email_outlined,
        color: Colors.white,
      ),
    ),
  );

  final txtPass = TextFormField(
    validator: (value) {
      if (value!.isEmpty) {
        return "Campo obligatorio*";
      }
      if (value.length < 4) {
        return "Se requiere una contraseña mas fuerte";
      }
      return null;
    },
    decoration: const InputDecoration(
      labelText: "New password *",
      labelStyle: const TextStyle(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.w300),
      prefixIcon: const Icon(
        Icons.password_outlined,
        color: Colors.white,
      ),
    ),
  );

  final spaceHoriz = const SizedBox(
    height: 10,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    opacity: 0.72,
                    fit: BoxFit.cover,
                    image: AssetImage('assets/portadaLogin.jpg'))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Form(
                    key: _keyForm,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        tittle,
                        spaceHoriz,
                        //imgProfile,
                        spaceHoriz,
                        imagen != null
                            ? imgProfile = Image.file(
                                imagen!,
                                height: 172,
                              )
                            : Center(),
                        spaceHoriz,
                        ElevatedButton(
                          onPressed: () {
                            opciones(context);
                          },
                          child: Text('Añadir foto de perfil'),
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
                        spaceHoriz,
                        ElevatedButton(
                          onPressed: () {
                            if (_keyForm.currentState!.validate()) {
                              print('Validacion exitosa');
                            } else {
                              print('Validacion erronea');
                            }
                          },
                          child: Text('Crear cuenta'),
                        ),
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
            ),
          ),
          //isLoading ? const LoadingModalWidget() : Container()
        ],
      ),
    );
  }
}
